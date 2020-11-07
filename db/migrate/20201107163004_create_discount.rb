class CreateDiscount < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.float :percentage
      t.integer :quantity
      t.references :merchant, foreign_key: true
    end
  end
end
