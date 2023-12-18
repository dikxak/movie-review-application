class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :genres
      t.string :director
      t.text :description
      t.integer :duration
      t.datetime :release_date
      t.string :cover_image

      t.timestamps
    end
  end
end
