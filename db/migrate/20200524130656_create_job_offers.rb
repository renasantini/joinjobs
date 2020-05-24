class CreateJobOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offers do |t|
      t.string :message
      t.references :profile, null: false, foreign_key: true
      t.references :headhunter, null: false, foreign_key: true
      t.string :title
      t.string :role
      t.integer :wage
      t.string :benefits
      t.string :expectations
      t.date :start_date

      t.timestamps
    end
  end
end
