class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image

  validates :post, :address, :name, :postage, :payment, :order_status, presence: true

  enum payment: {クレジットカード:0, 銀行振込:1}
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  def total_count
    self.orderDetails.all.sum(:count)
  end

end