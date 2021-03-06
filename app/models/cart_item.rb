class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :quantity, presence: true

  # 小計を求める
  def subtotal
    item.add_tax_price * quantity
  end

end
