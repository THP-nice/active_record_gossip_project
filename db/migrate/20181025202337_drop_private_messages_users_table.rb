class DropPrivateMessagesUsersTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :private_messages_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
