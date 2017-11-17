class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.string :user_ip
      t.decimal :middle_rating, precision: 8, scale: 2
      t.integer :num_of_voices
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
