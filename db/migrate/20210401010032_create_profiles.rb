class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :profile_details

      t.timestamps
    end
  end
end
