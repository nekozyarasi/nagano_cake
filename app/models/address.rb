class Address < ApplicationRecord

  belongs_to :customer
  with_options presence: true do
    validates :post
    validates :address
    validates :name
  end
  
    def address_display
    '〒' + post + ' ' + address + ' ' + name
  end
  
end
