class AddUserIdToCes < ActiveRecord::Migration
  def change
    add_column :ces, :user_id, :integer
    add_index :ces, :user_id
  end
end
