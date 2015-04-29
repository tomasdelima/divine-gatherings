class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :email, :text
    add_column :users, :gender, :text
    add_column :users, :facebook_id, :text
    add_column :users, :profile_picture, :text
  end
end
