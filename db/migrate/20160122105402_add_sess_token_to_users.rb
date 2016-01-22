class AddSessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sess_token, :string
    add_index :users, :sess_token
  end
end
