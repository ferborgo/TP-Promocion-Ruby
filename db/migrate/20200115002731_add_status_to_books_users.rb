class AddStatusToBooksUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :books_users, :status, :integer
  end
end
