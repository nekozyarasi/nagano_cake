class Address < ApplicationRecord
  belongs_to :customer
  with_options presence: true do
    validates :post
    validates :address
    validates :name
  end
end
