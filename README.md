# README

### Terminal Testing

Email search bar:

```2.3.0 :004 > user_input = "johndoe@example.com"
 => "johndoe@example.com"```

```2.3.0 :005 > found_user = User.all.select{|user| user.email == user_input}
  User Load (2.8ms)  SELECT "users".* FROM "users"```

 ```=> [#<User id: 1, email: "johndoe@example.com", name: "John Doe", receiveMarketing: true, receiveArticles: false, receiveDigest: true, created_at: "2016-11-29 21:55:29", updated_at: "2016-11-29 21:55:29">]
2.3.0 :006 > ```
