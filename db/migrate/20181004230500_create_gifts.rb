class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :token
      t.string :transaction_id
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :status
      t.string :number
      t.string :udid
      t.string :donor_id
      t.string :pledge
      t.string :shipping
      t.string :tracking_number
      t.string :phone
      t.string :name
      t.string :expiration

      t.timestamps
    end
  end
end
