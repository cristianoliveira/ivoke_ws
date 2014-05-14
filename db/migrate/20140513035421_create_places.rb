class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.text :description
      t.string :adress
      t.string :phone
      t.string :url_profile_img

      t.timestamps
    end
  end
end
