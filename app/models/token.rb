class Token < ApplicationRecord
  belongs_to :user

  # mocks up static methods
  # def generate(user)
  #   nonce = SecureRandom.uuid
  #   while nonce = true
  #     Token.find_by(nonce: [:nonce])
  #     if Token = nil
  #       break
  #     else
  #       nonce = SecureRandom.uuid
  #     end
  #   end
  # end
  #
  # def consume(nonce)
  #   User.find_by(nonce: [:nonce])
  #   user = Token.user_id
  #   Token.destory
  #   user
  #   else
  #     Token
  # end

end
