class RemovePicturesFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :pictures, :string
  end
end
