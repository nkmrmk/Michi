class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :spot
      t.text :body
      t.string :chain

      t.timestamps
    end
  end
end
