# README

### Terminal Testing

#### Email search bar:

2.3.0 :004 > user_input = "johndoe@example.com"
=> "johndoe@example.com"

2.3.0 :005 > found_user = User.all.select{|user| user.email == user_input}
  User Load (2.8ms)  SELECT "users".* FROM "users"

=> User id: 1, email: "johndoe@example.com", name: "John Doe", receiveMarketing: true, receiveArticles: false, receiveDigest: true, created_at: "2016-11-29 21:55:29", updated_at: "2016-11-29 21:55:29"

#### Token generate:

2.3.0 :027 > new_user = User.create(email: "susandoe@example.com", name: "Susan Doe", recei
veMarketing: false, receiveArticles: false, receiveDigest: false)

2.3.0 :029 > next_token = Token.create(:user_id => new_user.id, :nonce => SecureRandom.uuid
)
(0.1ms)  begin transaction
User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 4], ["LIMIT", 1]]
SQL (0.4ms)  INSERT INTO "tokens" ("nonce", "user_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["nonce", "531d75a1-205a-4d93-9a31-eaa2aef86860"], ["user_id", 4], ["created_at", 2016-12-01 19:01:15 UTC], ["updated_at", 2016-12-01 19:01:15 UTC]]
 (4.5ms)  commit transaction

=> Token id: 4, nonce: "531d75a1-205a-4d93-9a31-eaa2aef86860", user_id: 4, created_at: "2016-12-01 19:01:15", updated_at: "2016-12-01 19:01:15"

#### Token consume:

2.3.0 :001 > token = Token.find_by_id(1)
  Token Load (0.2ms)  SELECT  "tokens".* FROM "tokens" WHERE "tokens"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]

 => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59"

2.3.0 :002 > found_token = Token.find_by(nonce:  token.nonce)
  Token Load (0.3ms)  SELECT  "tokens".* FROM "tokens" WHERE "tokens"."nonce" = ? LIMIT ?  [["nonce", "775bc785-d7d0-441f-b324-7d48157ec980"], ["LIMIT", 1]]

 => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59"

2.3.0 :003 > found_token

 => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59"

2.3.0 :004 > set_user_id = found_token.user_id
 => 2

2.3.0 :005 > set_user_id
 => 2

 token_retrieved_user = User.find_by(:id => set_user_id)
   User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]

  => User id: 2, email: "janedoe@example.com", name: "Jane Doe", receiveMarketing: false, receiveArticles: true, receiveDigest: false, created_at: "2016-11-29 21:55:29", updated_at: "2016-11-29 21:55:29"

 2.3.0 :009 > token_retrieved_user

  => User id: 2, email: "janedoe@example.com", name: "Jane Doe", receiveMarketing: false, receiveArticles: true, receiveDigest: false, created_at: "2016-11-29 21:55:29", updated_at: "2016-11-29 21:55:29"

 2.3.0 :010 > token

  => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59"

 2.3.0 :011 > token.destroy
    (0.2ms)  begin transaction
   SQL (0.5ms)  DELETE FROM "tokens" WHERE "tokens"."id" = ?  [["id", 1]]
    (0.8ms)  commit transaction

  => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59">
 2.3.0 :012

2.3.0 :12 > token

  => Token id: 1, nonce: "775bc785-d7d0-441f-b324-7d48157ec980", user_id: 2, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59"

2.3.0 :013 > Token.all
   Token Load (0.2ms)  SELECT "tokens".* FROM "tokens"

  => ActiveRecord::Relation [Token id: 2, nonce: "e152cd41-60ad-413a-8ac4-b38fb1977cab", user_id: 1, created_at: "2016-11-29 21:59:59", updated_at: "2016-11-29 21:59:59", Token id: 3, nonce: nil, user_id: 3, created_at: "2016-12-01 18:40:01", updated_at: "2016-12-01 18:40:01", Token id: 4, nonce: "531d75a1-205a-4d93-9a31-eaa2aef86860", user_id: 4, created_at: "2016-12-01 19:01:15", updated_at: "2016-12-01 19:01:15"]

 2.3.0 :001 > found_token = Token.find_by(nonce: "775bc785-d7d0-441f-b324-7d48157ec980")
   Token Load (0.2ms)  SELECT  "tokens".* FROM "tokens" WHERE "tokens"."nonce" = ? LIMIT ?  [["nonce", "775bc785-d7d0-441f-b324-7d48157ec980"], ["LIMIT", 1]]

  => nil
