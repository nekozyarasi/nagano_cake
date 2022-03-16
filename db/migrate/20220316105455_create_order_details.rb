class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      # 注文ID
      t.integer :order_id
      # 商品ID
      t.integer :item_id
      # 数量
      t.integer :quantity
      # 製作ステータス
      t.integer :production_status

      t.timestamps
    end
  end
end
