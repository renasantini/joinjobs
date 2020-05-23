class RemoveItensFromJobApplications < ActiveRecord::Migration[6.0]
  def change
    remove_reference :job_applications, :job, null: false, foreign_key: true
    remove_reference :job_applications, :user, null: false, foreign_key: true
  end
end
