class CreateRecruits < ActiveRecord::Migration[5.2]
  def change
    create_table :recruits do |t|
      t.string :co_name
      t.text :title
      t.text :description
      t.string :pay
      t.string :phone_number
      t.string :postcode
      t.string :prefecture_code
      t.string :city
      t.string :street
      t.text :work_style
      t.text :access
      t.string :web_site
      t.text :transportation
      t.string :image
      t.text :required_license
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :recruits, [:user_id, :created_at]
  end
end
