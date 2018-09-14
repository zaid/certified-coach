class Coach < ApplicationRecord
  self.table_name = 'wp_fitpro_directory'

  scope :with_country, -> (country) { where(country: country) }
  scope :with_province, -> (province) { where(province: province) }
  scope :with_postal_code, -> (postal_code) { where(postalcode: postal_code) }
  scope :with_name, -> (name) { where(fullname: name) }

  def self.permitted_search_params
    %w(country province postal_code name)
  end

  def self.search_param_scope(filter)
    stringified_filter = (filter.is_a?(String) ? filter : filter.to_s)

    return nil unless self.permitted_search_params.include?(stringified_filter)

    "with_#{stringified_filter}"
  end
end
