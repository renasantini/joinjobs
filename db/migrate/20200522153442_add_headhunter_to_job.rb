class AddHeadhunterToJob < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobs, :headhunter, null: false, foreign_key: true
  end
end
