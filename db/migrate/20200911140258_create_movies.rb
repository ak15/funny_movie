class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :url
      t.string :video_id
      t.string :title
      t.text :description
      t.integer :like_count
      t.integer :dislike_count 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
