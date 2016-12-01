class Token < ApplicationRecord
  belongs_to :user

  def self.generate(user)
    token = Token.new(:user_id => user.id, :nonce => SecureRandom.uuid)
    token.save
  end

  def consume(token)
  # _consume_, which looks for a Token by its nonce. If it finds the token, it should delete it and return the associated User object. Otherwise it should return nil.
  end

end
