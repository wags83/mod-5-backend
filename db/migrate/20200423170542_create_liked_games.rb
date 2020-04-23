class CreateLikedGames < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_games do |t|
      t.belongs_to :user
      t.integer :game_id

      t.timestamps
    end
  end
end
