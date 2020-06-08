class ChangeColumnsInCourses < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :instructor,  :instructor_id
    rename_column :courses, :schedule,  :schedule_id

  end
end
