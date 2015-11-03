class AddRemoteIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :address_id, :integer
  end
end
