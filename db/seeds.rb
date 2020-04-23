# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Comment.destroy_all
LikedGame.destroy_all
Follower.destroy_all
Game.destroy_all

User.create(username: 'user1', password: 'a', email: 'abc@abc.com', bio: 'Some biographical text', avatar_url: 'https://www.nicepng.com/png/full/7-70528_pixel-mario-png-picture-library-mario-bros-64.png')
User.create(username: 'user2', password: 'a', email: 'abc@abc.com', bio: 'Some biographical text', avatar_url: 'https://www.nicepng.com/png/full/7-70528_pixel-mario-png-picture-library-mario-bros-64.png')

Game.create(name: 'Super Mario Brothers 3', api_id: 7, art_url: 'https://upload.wikimedia.org/wikipedia/en/a/a5/Super_Mario_Bros._3_coverart.png')

Comment.create(title: 'Comment Title', content: "Flerg", game_id: Game.all.sample.id, user_id: User.all.sample.id)
