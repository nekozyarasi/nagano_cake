class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      # 会員ID
      t.integer :customer_id
      # 配送先郵便番号
      t.string :post
      # 配送先住所
      t.string :address
      # 配送先氏名
      t.string :name
      # 送料
      t.integer :postage, default: 800, null: false
      # 請求額
      t.integer :total_due
      # 支払方法
      t.integer :payment
      # 受注ステータス
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
