class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false, index: {unique: true}
    add_column :users, :realname, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :web, :string
  end
end
