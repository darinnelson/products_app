class ChangeUsedIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :carted_products, :used_id, :user_id
  end
end
