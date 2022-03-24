class Item < ApplicationRecord
   has_one_attached :item_image
   belongs_to :genre
   has_many :order_details

    def add_tax_price
        (self.price * 1.08).round
    end

	validates :genre_id, :name, :price, presence: true
	validates :introduction, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }

end
