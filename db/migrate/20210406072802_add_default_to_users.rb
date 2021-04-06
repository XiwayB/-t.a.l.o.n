class AddDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :role, from: nil, to: 'medic')
    change_column_default(:users, :status, from: nil, to: 'healthy')
  end
end
