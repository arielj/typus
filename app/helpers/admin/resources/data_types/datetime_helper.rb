module Admin::Resources::DataTypes::DatetimeHelper

  def table_datetime_field(attribute, item)
    if field = item.send(attribute)
      I18n.localize(field, format: item.class.typus_date_format(attribute))
    end
  end

  alias_method :table_date_field, :table_datetime_field
  alias_method :table_time_field, :table_datetime_field
  alias_method :table_timestamp_field, :table_datetime_field

  def display_datetime(item, attribute)
    if d = item.send(attribute)
      I18n.l(d, format: @resource.typus_date_format(attribute))
    else
      '&mdash;'.html_safe
    end
  end

  alias_method :display_date, :display_datetime

end
