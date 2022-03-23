class Order < ApplicationRecord

  belongs_to :customer

  has_many :orderDetails

  def total_count
    self.orderDetails.all.sum(:count)
  end

end
