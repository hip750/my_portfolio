class AddUseInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_ruby, :string
    add_column :users, :last_name_ruby, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :age, :integer
    add_column :users, :license, :string
    add_column :users, :career, :text
    add_column :users, :zip_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :town, :string
    add_column :users, :phone_number, :string
    add_column :users, :self_promotion, :text
    add_column :users, :work_times, :text
  end
end
