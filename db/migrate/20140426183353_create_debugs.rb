class CreateDebugs < ActiveRecord::Migration
  def change
    create_table :debugs do |t|
      t.text :message

      t.timestamps
    end
  end
end
