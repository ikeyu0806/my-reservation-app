class User < ApplicationRecord
  has_one :reservation, dependent: :destroy
end
