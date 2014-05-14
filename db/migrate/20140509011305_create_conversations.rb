class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :user_one, index: true
      t.references :user_two, index: true
      t.integer    :time
      t.integer    :status

      t.timestamps
    end
  end
end
