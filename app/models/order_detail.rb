class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  def amount
    item.add_tax_price * quantity
  end

end
