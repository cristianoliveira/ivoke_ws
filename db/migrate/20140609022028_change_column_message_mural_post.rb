class ChangeColumnMessageMuralPost < ActiveRecord::Migration
  def change
      change_column :mural_posts, :message, :text
  end
end
