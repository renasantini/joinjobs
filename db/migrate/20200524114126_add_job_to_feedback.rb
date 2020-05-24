class AddJobToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_reference :feedbacks, :job, null: false, foreign_key: true
  end
end
