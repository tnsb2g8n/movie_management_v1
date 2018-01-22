class CreateMovieCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :movie_categories, comment: '動画カテゴリ' do |t|
      t.references :service, foreign_key: true
      t.string :name
      t.boolean :must_view
      t.integer :sort_order

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
