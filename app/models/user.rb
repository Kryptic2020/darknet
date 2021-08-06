class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
         has_many :products, dependent: :destroy
         has_many :carts, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :products, through: :messages, dependent: :destroy
         has_one :shipping_info, dependent: :destroy
end
