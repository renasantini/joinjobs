class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :skills
      t.string :wage_range
      t.string :level
      t.date :limit_date
      t.string :location
      t.string :company

      t.timestamps
    end
  end
end
