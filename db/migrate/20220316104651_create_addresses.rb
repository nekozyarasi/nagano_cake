class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      # 会員ID
      t.integer :customer_id
      # 配送先宛名
      t.string :name
      # 郵便番号
      t.string :post
      # 配送先住所
      t.string :address

      t.timestamps
    end
  end
end
