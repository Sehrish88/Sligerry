class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :discipline
      t.string :password_digest 

      t.timestamps
    end
  end
end
