class CreateMuralPosts < ActiveRecord::Migration
  def change
    create_table :mural_posts do |t|
      t.belongs_to :user, index: true
      t.float :latitude
      t.float :longitude
      t.string :message

      t.timestamps
    end
  end
end
