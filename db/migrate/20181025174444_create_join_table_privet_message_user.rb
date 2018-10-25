class CreateJoinTablePrivetMessageUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :private_messages, :users, index: false do |t|
      t.belongs_to :private_message, index: true
      t.belongs_to :user, index: true
      # t.index [:private_message_id, :user_id]
      # t.index [:user_id, :private_message_id]
    end
  end
end
