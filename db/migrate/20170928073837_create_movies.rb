class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.datetime :release_date
      t.string :genre
      t.string :title
      t.integer :nk_movie_id

      t.timestamps
    end
  end
end
