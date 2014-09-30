class CreateLogErrors < ActiveRecord::Migration
  def change
    create_table :log_errors do |t|
      t.string :report_id
      t.string :app_version_name
      t.string :android_version
      t.string :phone_model
      t.text   :stack_trace
      t.text   :setting_global
      t.text   :shared_preferences
      t.string :brand

      t.timestamps
    end
  end
end
