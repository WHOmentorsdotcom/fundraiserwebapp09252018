class CreateContributionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :contribution_options do |t|
      t.decimal :amount
      t.string :amount_display
      t.text :description
      t.string :shipping_desc
      t.string :delivery_desc
      t.integer :limit

      t.timestamps
    end
  end
end
