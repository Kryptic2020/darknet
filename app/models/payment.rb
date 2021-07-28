class Payment < ApplicationRecord
  has_one :cart, dependent: :destroy
end
