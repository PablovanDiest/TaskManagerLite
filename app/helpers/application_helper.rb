module ApplicationHelper
  def format_date(datetime)
    datetime.strftime('%d/%m/%Y')
  end

  def format_datetime(datetime)
    return '' unless datetime
    datetime.strftime('%d/%m/%Y %H:%M')
  end

  def disabled_check_box(checked)
    check_box_tag 'disabled_check_box', checked, checked, :disabled => true
  end

end
