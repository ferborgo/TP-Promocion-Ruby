class AddIdToBooksUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :books_users, :id, :primary_key
  end
end
