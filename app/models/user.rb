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

  #Validations
  validates :username, presence: true, length: {minimum: 3, too_short: "3 is the minimum number of caracter"}       

  #data santization
  before_save :remove_whitespace

  private 

  # remove any whitespace before saving user
  def remove_whitespace
    self.email = self.email.strip
    self.encrypted_password = self.encrypted_password.strip
    self.username = self.username.strip
  end       
end
