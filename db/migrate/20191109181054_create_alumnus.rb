class CreateAlumnus < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnus do |t|
      t.string :name
      t.integer :yearGraduated
      t.string :college
      t.string :profession
      t.string :sportPlayedInHighSchool
      t.string :currentlyLiving
      t.string :hobbies

      t.timestamps
    end
  end
end
