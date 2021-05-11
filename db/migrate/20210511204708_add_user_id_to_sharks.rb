class AddUserIdToSharks < ActiveRecord::Migration[5.2]
  def change
    add_column :sharks, :user_id, :integer
  end
end
