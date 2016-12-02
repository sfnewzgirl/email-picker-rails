class Token < ApplicationRecord
  belongs_to :user
  validates :nonce, presence: true, uniqueness: true

  def self.generate(user)
    token = Token.new(:user_id => user.id, :nonce => SecureRandom.uuid)
    # TODO add check for unique nonce
    token.save
    token
  end

  def self.consume(token)
    found_token = Token.find_by(nonce:  token.nonce)
    if found_token
      set_user_id = found_token.user_id
      token_retrieved_user = User.find_by(:id => set_user_id)
      token_retrieved_user
      token.destroy
    else
      nil
    end
  end

end
