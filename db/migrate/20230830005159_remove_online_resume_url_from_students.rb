class RemoveOnlineResumeUrlFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :online_resume, :string
  end
end
