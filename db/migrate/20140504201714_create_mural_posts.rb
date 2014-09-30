class CreateMuralPosts < ActiveRecord::Migration
  def change
    create_table(:mural_posts, :options => "ENGINE=MyISAM") do |t|
      t.belongs_to :user, index: true
      t.decimal :latitude  , :precision => 10, :scale => 8
      t.decimal :longitude , :precision => 10, :scale => 8
      t.string  :message
      t.integer :anonymous , default: 0
      t.string  :place_id, :limit => 10000, default: 'null', index: true
      t.index   [:latitude, :longitude]
      
      t.timestamps
    end
  end
end
