class AddStarsToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :stars, :integer
  end
end
