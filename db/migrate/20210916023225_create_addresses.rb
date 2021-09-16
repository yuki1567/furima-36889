class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipalities, null: false
      t.string     :street_address, null: false
      t.string     :detail_address
      t.string     :telephone, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
