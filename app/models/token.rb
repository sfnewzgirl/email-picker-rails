class Token < ApplicationRecord
  belongs_to :user
  validates :nonce, presence: true, uniqueness: true

  def self.generate(user)
    while true
      nonce = SecureRandom.uuid
      token_search = Token.find_by(:nonce => nonce)
      if token_search == nil
        break
      end
    end
    Token.create(:user_id => user.id, :nonce => nonce)
  end

  def self.consume(nonce)
    found_token = Token.find_by(nonce: nonce)
    if found_token
      set_user_id = found_token.user_id
      token_retrieved_user = User.find_by(:id => set_user_id)
      found_token.destroy
      token_retrieved_user
    else
      nil
    end
  end

end
