class Condition < ApplicationRecord
  has_many :products, dependent: :destroy
end
