class ChangeMoviesGenreId < ActiveRecord::Migration[6.0]

    def change
      change_column :movies, :genre, :string
    end
end
