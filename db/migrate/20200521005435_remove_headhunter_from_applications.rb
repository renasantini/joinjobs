class RemoveHeadhunterFromApplications < ActiveRecord::Migration[6.0]
  def change
    remove_reference :applications, :headhunter, null: false, foreign_key: true
  end
end
