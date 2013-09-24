class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_module_id
      t.integer :position
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
