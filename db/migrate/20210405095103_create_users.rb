class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :wechat_account
      t.string :role
      t.string :pictures
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
