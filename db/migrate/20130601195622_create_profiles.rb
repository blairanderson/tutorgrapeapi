class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :lattitude
      t.string :longitude
      t.string :age
      t.string :photo
      t.string :job_title
      t.string :corportation
      t.boolean :tutor

      t.timestamps
    end
  end
end
