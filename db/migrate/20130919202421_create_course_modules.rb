class CreateCourseModules < ActiveRecord::Migration
  def change
    create_table :course_modules do |t|
      t.string :name
      t.text :description
      t.integer :unlocks_in

      t.timestamps
    end
  end
end
