class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, presence: true
  validates :password, presence: true

  has_many :cart_items, dependent: :destroy
  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy

end
