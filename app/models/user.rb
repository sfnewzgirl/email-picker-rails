class User < ApplicationRecord
  has_one :token
  validates :email, uniqueness: true, presence: true

end
