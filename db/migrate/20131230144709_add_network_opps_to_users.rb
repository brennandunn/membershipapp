class AddNetworkOppsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :network_opps, :text
  end
end
