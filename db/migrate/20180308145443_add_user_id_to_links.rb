class AddUserIdToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :user_id, :string
    add_column :links, :integer, :string
    add_index :links, :integer
  end
end
