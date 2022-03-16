class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      # ジャンルＩＤ
      t.integer :genre_id
      # 商品名
      t.string :name
      # 商品説明
      t.text :introduction
      # 税抜価格
      t.integer :price
      # 商品画像
      t.string :item_image
      # 販売ステータス
      t.boolean :is_sale_status

      t.timestamps
    end
  end
end
