class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable


   has_many :cart_items, dependent: :destroy
   has_many :orders, dependent: :destroy
   has_many :ships, dependent: :destroy

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_family_name, presence: true
  validates :post, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
