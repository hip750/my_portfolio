class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :evaluation
      t.text :content
      t.integer :recruit_id
      t.integer :user_id

      t.timestamps
    end
  end
end
