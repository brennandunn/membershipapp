class AddUnlocksInToCourseModules < ActiveRecord::Migration
  def change
    add_column :course_modules, :unlocks_in_number, :integer
    add_column :course_modules, :unlocks_in_unit, :string
  end
end
