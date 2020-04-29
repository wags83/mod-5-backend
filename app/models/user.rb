class User < ApplicationRecord
    has_many :comments
    has_many :liked_games
    has_many :followers
end
