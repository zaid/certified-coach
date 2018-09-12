class Coach < ApplicationRecord
  self.table_name = 'wp_fitpro_directory'

  scope :with_country, -> (country) { where(country: country) }
  scope :with_province, -> (province) { where(province: province) }
  scope :with_postal_code, -> (postal_code) { where(postalcode: postal_code) }
  scope :with_name, -> (name) { where(fullname: name) }
end
