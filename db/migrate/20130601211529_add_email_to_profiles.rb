class AddEmailToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :email, :string
    remove_column :profiles, :corportation
    add_column :profiles, :corporation, :string
  end
end
