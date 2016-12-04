# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john_doe = User.create({ email: 'johndoe@example.com', name: 'John Doe', receiveMarketing: true, receiveArticles: false, receiveDigest: true })
jane_doe = User.create({ email: 'janedoe@example.com', name: 'Jane Doe', receiveMarketing: false, receiveArticles: true, receiveDigest: false })
misha_leclair = User.create({ email: 'misha@example.com', name: 'Misha LeClair', receiveMarketing: false, receiveArticles: true, receiveDigest: true })
Token.create({ nonce: '775bc785-d7d0-441f-b324-7d48157ec980', user_id: jane_doe.id})
Token.create({ nonce: 'e152cd41-60ad-413a-8ac4-b38fb1977cab', user_id: john_doe.id})
