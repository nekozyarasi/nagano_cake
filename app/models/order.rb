class Order < ApplicationRecord

  belongs_to :Customer

  has_many :OrderDetails, dependent: :destroy

  def total_count
    self.order_details.all.sum(:count)
  end

end
