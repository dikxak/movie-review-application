class ChangeRoleToBeIntegerInUsers < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :role, 'integer USING CAST(role AS integer)'
  end

  def down
    change_column :users, :role, :string
  end
end
