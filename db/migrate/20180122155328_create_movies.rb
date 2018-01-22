class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies, comment: '動画' do |t|
      t.references :movie_category, foreign_key: true
      t.string :title
      t.string :url
      t.integer :sort_order

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
