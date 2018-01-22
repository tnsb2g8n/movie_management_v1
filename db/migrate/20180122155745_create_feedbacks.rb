class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks, comment: '感想フィードバック' do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
