class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :info, :text
    add_column :users, :favorite_genres, :text
  end
end
