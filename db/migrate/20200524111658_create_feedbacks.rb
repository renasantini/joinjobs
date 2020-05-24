class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.references :headhunter, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :feedback

      t.timestamps
    end
  end
end
