class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
         has_many :products, dependent: :destroy
         has_many :carts, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_one :user_contact_info, dependent: :destroy

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving a listing
  def remove_whitespace
    
  end       
end
