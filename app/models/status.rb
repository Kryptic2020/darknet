class Status < ApplicationRecord
  has_many :carts, dependent: :destroy
end
