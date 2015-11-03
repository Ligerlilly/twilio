class CreateAddressesMessages < ActiveRecord::Migration
  def change
    create_table :addresses_messages do |t|
      t.integer :address_id
      t.integer :message_id

      t.timestamps
    end
  end
end
