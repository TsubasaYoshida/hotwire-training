module DeviseHelper
  def bootstrap_alert(type)
    case type
    when 'alert'
      'warning'
    when 'notice'
      'success'
    when 'error'
      'danger'
    else
      type
    end
  end
end
