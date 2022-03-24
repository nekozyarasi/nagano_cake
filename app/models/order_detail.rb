class OrderDetail < ApplicationRecord
    
    belongs_to :item
    belongs_to :order
    
    validates :quantity, :production_status, presence: true
    
    enum production_status: {cannot_be_manufactured:0, waiting_for_production:1, production:2, production_completed:3}
end
