class AddColumnMyRatingToUsers < ActiveRecord::Migration
  def change
    add_column :movies, :my_rating, :string
  end
end
