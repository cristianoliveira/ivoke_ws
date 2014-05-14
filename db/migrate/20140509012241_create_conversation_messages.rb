class CreateConversationMessages < ActiveRecord::Migration
  def change
    create_table :conversation_messages do |t|
      t.belongs_to :conversation, index: true
      t.belongs_to :user, index: true
      t.text :message
      t.integer :time
      t.integer :status

      t.timestamps
    end
  end
end
