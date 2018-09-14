class AddIndexOnCountryAndProvinceToCoach < ActiveRecord::Migration[5.2]
  def change
    add_index :wp_fitpro_directory, [:country, :province]
  end
end
