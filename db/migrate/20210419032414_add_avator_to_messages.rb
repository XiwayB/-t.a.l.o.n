class AddAvatorToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :avatar, :text
  end
end
