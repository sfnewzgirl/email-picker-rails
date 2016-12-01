class Token < ApplicationRecord
  belongs_to :user

  def self.generate(user)
    token = Token.new(:user_id => user.id, :nonce => SecureRandom.uuid)
    token.save
  end

  def consume(token)
    found_token = Token.find_by(nonce: => token.nonce)
    if found_token
      set_user_id = found_token.user_id
      token_retrieved_user = User.find_by(:id => set_user_id)
      token.destroy
      token_retrieved_user
    else
      nil
    end
  # _consume_, which looks for a Token by its nonce. If it finds the token, it should delete it and return the associated User object. Otherwise it should return nil.
  end

end
