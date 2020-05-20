class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :name
      t.date :birth_date
      t.string :document
      t.string :graduation
      t.string :university
      t.text :description
      t.text :experience

      t.timestamps
    end
  end
end
