class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
         has_many :products, dependent: :destroy
         has_many :carts, dependent: :destroy
         has_one :user_contact_info, dependent: :destroy
end
