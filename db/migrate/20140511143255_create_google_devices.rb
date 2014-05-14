class CreateGoogleDevices < ActiveRecord::Migration
  def change
    create_table :google_devices do |t|
      t.belongs_to :user, index: true
      t.string :registration_id
      t.integer :acept_notification

      t.timestamps
    end
  end
end
