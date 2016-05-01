class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar
  end

  def down
    remove_attachment :users, :avatar
  end
end
