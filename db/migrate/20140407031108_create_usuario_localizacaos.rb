class CreateUsuarioLocalizacaos < ActiveRecord::Migration
  def change
    create_table :usuario_localizacaos do |t|
      t.references :usuario, index: true
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
