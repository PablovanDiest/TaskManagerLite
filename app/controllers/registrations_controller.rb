class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource(sign_up_params)
    #Load user and customer params variables.
    user = params[:user]
    if (user[:company_id] != '')
      @company = Company.find( user[:company_id] )
    end
    #Complete the user data.
    #resource.last_name   = user[:last_name]
    #resource.first_name  = user[:first_name]
    resource.role        = (user[:company_id] == '' ? 'admin' : 'guest')
    resource.super_admin = (resource.role == 'admin' and Company.all.count == 0)
    resource.notes       = ''
    resource_saved = false

    if ((user[:company_id] == '') and (user[:company_name] == ''))
      resource.errors.add(:base, 'Debe indicar el nombre de la empresa.')
    end


    Rails.logger.info( '<========== CREATE: ActiveRecord Transaction' )
    unless resource.errors.any?
      ActiveRecord::Base.transaction do
        begin
          #Create the new User
          User.transaction(requires_new: true) do
            resource_saved = resource.save
            if resource_saved
              Rails.logger.info( '<========== CREATE: Customer Transaction' )
              Company.transaction(requires_new: true) do
                create_company(user, resource)
              end
            end
          end
          Rails.logger.info( '<========== CREATE: Last line before RESCUE' )
        rescue Exception => ex
          resource.errors.add(:base, ex.message)
          resource_saved = false
          Rails.logger.info( "<========== CREATE: Exception => #{ex.message}" )
          raise ActiveRecord::Rollback
        end
      end
    end
    Rails.logger.info( '<========== CREATE: END of added code' )

    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private
  def create_company(user, resource)
    if ((user[:company_id] == '') and (user[:company_name] != ''))
      @company = Company.create!(  name: user[:company_name], created_by_id: resource.id)
    end
  end

end