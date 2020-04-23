class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :api_id
      t.string :name
      t.string :art_url

      t.timestamps
    end
  end
end
