class RemovePhotosFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :photos, :text
  end
end
