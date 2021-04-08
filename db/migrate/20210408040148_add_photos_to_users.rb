class AddPhotosToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photos, :text, array: true, default: []
  end
end
