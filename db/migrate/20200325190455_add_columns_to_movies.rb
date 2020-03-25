class AddColumnsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :poster_path, :string
    add_column :movies, :backdrop_path, :string
    add_column :movies, :genre, :integer
    add_column :movies, :overview, :string
    add_column :movies, :release_date, :date
  end
end
