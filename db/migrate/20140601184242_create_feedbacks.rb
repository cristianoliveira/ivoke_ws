class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.text :message
      t.text :suggestion

      t.timestamps
    end
  end
end
