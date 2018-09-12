class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :wp_fitpro_directory do |t|
      t.bigint :userid
      t.string :source, limit: 80
      t.string :fullname, limit: 255
      t.string :businessname, limit: 255
      t.string :address1, limit: 255
      t.string :address2, limit: 255
      t.string :city, limit: 255
      t.string :province, limit: 255 
      t.string :postalcode, limit: 255
      t.string :country, limit: 255
      t.string :email, limit: 255
      t.string :businessphone, limit: 255
      t.string :mobilephone, limit: 255
      t.string :url, limit: 255
      t.text :speciality
      t.bigint :show_in_directory, default: 0
      t.bigint :level1_status, default: 0
      t.bigint :level2_status, default: 0
      t.bigint :procoach_status, default: 0
      t.integer :url_last_checked
      t.integer :url_last_status, limit: 2
    end
  end
end
