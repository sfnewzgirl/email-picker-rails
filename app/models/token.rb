class Token < ApplicationRecord
  belongs_to :user

  def self.generate(user)
    token = Token.new(:user_id => user, :nonce => SecureRandom.uuid)
    token.save
  end
  
end
