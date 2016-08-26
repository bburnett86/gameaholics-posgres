5.times do
  User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    state: Faker::Address.state,
    password: "password"
    )
end

User.create!(
    username: "emily",
    email: "emily@emily.com",
    city: "Philly",
    state: "Pennsylvania",
    password: "password")

User.create!(
    username: "bret",
    email: "bret@bret.com",
    city: "Chicago",
    state: "Illinois",
    password: "password")

User.create!(
    username: "katie",
    email: "katie@katie.com",
    city: "North Riverside",
    state: "Illinois",
    password: "password")

User.create!(
    username: "austin",
    email: "austin@austin.com",
    city: "Northwest Chi Burbs",
    state: "Illinois",
    password: "password")

User.create!(
    username: "mike",
    email: "mike@mike.com",
    city: "Chicago",
    state: "Illinois",
    password: "password")

Game.create!(name: "Boggle", description: "It's a game about recursion!", rules_url: "http://www.hasbro.com/common/instruct/boggle.pdf", image_url: "http://www.slate.com/content/dam/slate/articles/life/gaming/2013/07/130725_GAME_boggleboard.jpg.CROP.original-original.jpg")
Game.create!(name: "Monopoly", description: "It's a game where you take people's money", rules_url: "http://richard_wilding.tripod.com/monorules.htm", image_url: "http://www.blogblowfish.com/wp-content/uploads/2015/09/monopoly.jpg")
Game.create!(name: "Settlers of Catan", description: "It's a game where you trade things for sheep", rules_url: "http://www.catan.com/service/game-rules", image_url: "http://www.dadsgamingaddiction.com/wp-content/uploads/2012/03/img_0168.jpg")
Game.create!(name: "Magic", description: "It's a game where you spend money!", rules_url: "http://magic.wizards.com/en/gameinfo/gameplay/formats/comprehensiverules", image_url: "http://media.wizards.com/2016/images/daily/4RcI794lvy_Nahiri.jpg")
Game.create!(name: "The Whale Game", description: "Whale I ever be happy?", rules_url: "http://magic.wizards.com/en/gameinfo/gameplay/formats/comprehensiverules", image_url: "https://img0.etsystatic.com/057/0/6692852/il_570xN.716044984_7k0u.jpg")
Game.create!(name: "Sorry!", description: "It's a game that takes place in Canada", rules_url: "https://en.wikipedia.org/wiki/Sorry!_(game)", image_url: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=17404060")
Game.create!(name: "Scrabble", description: "It's a game where you spell things", rules_url: "http://www.scrabblesite.com/scrabble/rules/", image_url: "https://cdn3.bigcommerce.com/s-2q6av/product_images/uploaded_images/scrabble.jpg")
Game.create!(name: "TRUMP: THE GAME", description: "It's a game where you're an asshole'", rules_url: "http://www.scrabblesite.com/scrabble/rules/", image_url: "http://cf.geekdo-images.com/images/pic1175306_lg.jpg")
Game.create!(name: "Cones of Dunshire", description: "It's a game where you're an asshole'", rules_url: "http://www.scrabblesite.com/scrabble/rules/", image_url: "http://geekandsundry.com/wp-content/uploads/2015/05/Cones-of-Dunshire.jpg")






games = Game.all
users = User.all

Rating.create!(game_id: 1, rater_id: users.sample.id, value: 3)
Rating.create!(game_id: 2, rater_id: users.sample.id, value: 3)
Rating.create!(game_id: 3, rater_id: users.sample.id, value: 3)

Ownership.create!(owner_id: 1, game_id: 1)
Ownership.create!(owner_id: 1, game_id: 2)
Ownership.create!(owner_id: 1, game_id: 3)

Comment.create!(game_id: 1, commenter_id: 1, content: "Yo this game sucks")
Comment.create!(game_id: 1, commenter_id: 1, content: "How do I write a recursive algorithm about this? Id on't understand")
Comment.create!(game_id: 2, commenter_id: 3, content: "I think this game is pretty great")
Comment.create!(game_id: 1, commenter_id: 2, content: "Hello I ordered this game a while ago and all I got was a rock")
Comment.create!(game_id: 2, commenter_id: 2, content: "Hello I ordered this game a while ago and all I got was a rock")
Comment.create!(game_id: 3, commenter_id: 2, content: "Hello I ordered this game a while ago and all I got was a rock")
Comment.create!(game_id: 4, commenter_id: 2, content: "Hello I ordered this game a while ago and all I got was a rock")
Comment.create!(game_id: 6, commenter_id: 2, content: "Hello I ordered this game a while ago and all I got was a rock")
Comment.create!(game_id: 5, commenter_id: 1, content: "Whale I ever be happy?")
Comment.create!(game_id: 5, commenter_id: 2, content: "Spouting makes me happy briefly")
Comment.create!(game_id: 5, commenter_id: 2, content: "What is the sexiest whale?")
Comment.create!(game_id: 2, commenter_id: 3, content: "This game is sooo boring")
Comment.create!(game_id: 7, commenter_id: 4, content: "I rock at this game!")
Comment.create!(game_id: 8, commenter_id: 4, content: "You're fired! Hahahaha")
Comment.create!(game_id: 7, commenter_id: 2, content: "I rock at this game!")

Vote.create!(comment_id: 1, value: -1, voter_id: 1)
Vote.create!(comment_id: 2, value: -1, voter_id: 1)
Vote.create!(comment_id: 3, value: -1, voter_id: 1)
Vote.create!(comment_id: 4, value: -1, voter_id: 1)
Vote.create!(comment_id: 5, value: -1, voter_id: 1)
Vote.create!(comment_id: 6, value: -1, voter_id: 1)
Vote.create!(comment_id: 7, value: -1, voter_id: 1)

Tag.create!(name: "Strategy")
Tag.create!(name: "Party")
Tag.create!(name: "Luck")

Tagging.create!(tag_id: 1, game_id: 1)
Tagging.create!(tag_id: 1, game_id: 2)



17.times do
  Ownership.create!(
    owner_id: users.sample.id,
    game_id: games.sample.id
    )
end
