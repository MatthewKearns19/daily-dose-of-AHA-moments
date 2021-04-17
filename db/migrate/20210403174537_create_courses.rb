class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :user
      t.string :course_name
      t.string :course_description
      t.string :course_content

      t.timestamps
    end
  end
end
