class CreateCapstones < ActiveRecord::Migration[7.0]
  def change
    create_table :capstones do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :screenshot
      t.string :attributes_of_the_student_model

      t.timestamps
    end
  end
end
