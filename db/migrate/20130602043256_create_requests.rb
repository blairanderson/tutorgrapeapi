class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :requester_id
      t.integer :subject_id
      t.integer :state

      t.timestamps
    end
    add_index :requests, :user_id
    add_index :requests, :requester_id
    add_index :requests, :subject_id
    add_index :requests, :state
  end
end
