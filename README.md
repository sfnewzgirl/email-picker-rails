# README

### Terminal Testing

Email search bar:

2.3.0 :004 > user_input = "johndoe@example.com"
 => "johndoe@example.com"

2.3.0 :005 > found_user = User.all.select{|user| user.email == user_input}
  User Load (2.8ms)  SELECT "users".* FROM "users"
=> [#<User id: 1, email: "johndoe@example.com", name: "John Doe", receiveMarketing: true, receiveArticles: false, receiveDigest: true, created_at: "2016-11-29 21:55:29", updated_at: "2016-11-29 21:55:29">]
2.3.0 :006 >

Generate token for user:

2.3.0 :027 > new_user = User.create(email: "susandoe@example.com", name: "Susan Doe", recei
veMarketing: false, receiveArticles: false, receiveDigest: false)

2.3.0 :029 > next_token = Token.create(:user_id => new_user.id, :nonce => SecureRandom.uuid
)

(0.1ms)  begin transaction
User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT ?  [["id", 4], ["LIMIT", 1]]
SQL (0.4ms)  INSERT INTO "tokens" ("nonce", "user_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["nonce", "531d75a1-205a-4d93-9a31-eaa2aef86860"], ["user_id", 4], ["created_at", 2016-12-01 19:01:15 UTC], ["updated_at", 2016-12-01 19:01:15 UTC]]
 (4.5ms)  commit transaction

=> #<Token id: 4, nonce: "531d75a1-205a-4d93-9a31-eaa2aef86860", user_id: 4, created_at: "2016-12-01 19:01:15", updated_at: "2016-12-01 19:01:15">
