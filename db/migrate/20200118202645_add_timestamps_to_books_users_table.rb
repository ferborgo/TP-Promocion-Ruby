class AddTimestampsToBooksUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :books_users, null: true
  end
end
