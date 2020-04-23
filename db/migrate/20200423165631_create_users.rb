class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.text :bio
      t.string :avatar_url
      t.string :favorite_genre
      t.string :email

      t.timestamps
    end
  end
end
