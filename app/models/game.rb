class Game < ApplicationRecord
    has_many :comments
    has_many :liked_games
end
