class Order < ApplicationRecord

  belongs_to :customer

  has_many :order_details

  def total_count
    self.orderDetails.all.sum(:count)
  end

end
