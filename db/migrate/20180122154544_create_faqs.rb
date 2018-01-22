class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs, comment: 'よくある質問' do |t|
      t.text :question
      t.text :answer
      t.integer :sort_order

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
