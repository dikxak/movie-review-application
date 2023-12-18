class AddNewColumnToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :poster_image, :string
  end
end
