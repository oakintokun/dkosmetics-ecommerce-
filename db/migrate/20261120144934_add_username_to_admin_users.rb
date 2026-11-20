class AddUsernameToAdminUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :admin_users, :username, :string
  end
end
