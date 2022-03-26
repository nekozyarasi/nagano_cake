class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image

  validates :post, :address, :name, :postage, :total_due, :payment, :order_status, presence: true

  enum payment: {credit_card:0, transfer:1}
  enum order_status: {waiting_for_deposit:0, payment_confirmation:1, production:2, ready_to_ship:3, sent:4}

  def total_count
    self.orderDetails.all.sum(:count)
  end

end