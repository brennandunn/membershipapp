class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :timezone, :string
    add_column :users, :bio, :text
    add_column :users, :skills, :text
    add_column :users, :looking_for_work, :boolean
    add_column :users, :remote, :boolean
    add_column :users, :rate_info, :string
  end
end
