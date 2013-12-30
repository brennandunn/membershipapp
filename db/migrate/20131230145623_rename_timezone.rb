class RenameTimezone < ActiveRecord::Migration
  def up
  	rename_column :users, :timezone, :time_zone
  end

  def down
  end
end
