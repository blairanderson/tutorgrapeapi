class AddActivationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :activation_key, :string
  end
end
