class CreateSubjectUsers < ActiveRecord::Migration
  def change
    create_table :subject_users do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :level

      t.timestamps
    end
    add_index :subject_users, :user_id
    add_index :subject_users, :subject_id
    add_index :subject_users, :level
    drop_table :user_subjects
  end
end
