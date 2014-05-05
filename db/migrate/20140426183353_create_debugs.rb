class CreateDebugs < ActiveRecord::Migration
  def change
    create_table :debugs do |t|
      t.string :message

      t.timestamps
    end
  end
end
