class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, :options => "ENGINE=MyISAM") do |t|
      t.string  :name
      t.string  :gender, :limit => 10 
      t.string  :facebook_id, uniqueness: true

      t.timestamps
    end
  end
end
