class Address < ApplicationRecord
  
  belongs_to :customer
  
  validates :name, :post, :address, presence: true
  
  def address_display
    '〒' + post + ' ' + address + ' ' + name
  end
  
end
