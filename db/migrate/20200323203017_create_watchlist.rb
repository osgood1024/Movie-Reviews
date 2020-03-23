class CreateWatchlist < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlists do |t|
      t.integer :movie_id
      t.integer :user_id
      t.timestamps
    end
  end
end
