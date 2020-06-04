class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description 
      t.integer :schedule
      t.integer :instructor

      t.timestamps
    end
  end
end
