class AddAnswerToJobOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :job_offers, :status, :integer
    add_column :job_offers, :confirm_start, :boolean
    add_column :job_offers, :answer_message, :string
  end
end
