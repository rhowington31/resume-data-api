class AddAttributesToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :online_resume_url, :string
  end
end
