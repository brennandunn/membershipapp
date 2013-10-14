class AddInfusionsoftIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :infusionsoft_id, :integer
  end
end
