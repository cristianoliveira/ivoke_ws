class CreateMuralPosts < ActiveRecord::Migration
  def change
    create_table :mural_posts do |t|
      t.references :usuario, index: true
      t.string :from
      t.float :latitude
      t.float :longitude
      t.string :message
      t.datetime :posted_at

      t.timestamps
    end
  end
end
