class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :headhunter, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.string :observations

      t.timestamps
    end
  end
end
