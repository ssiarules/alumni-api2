class ChangeAlumnusToAlumnis < ActiveRecord::Migration[5.2]
  def change
    rename_table :alumnus, :alumnis
  end
end
