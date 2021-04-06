class UpdateLocationType < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :location, :text)
  end
end
