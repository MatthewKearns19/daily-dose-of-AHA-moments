class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :user
      t.string :name
      t.string :url
      t.string :description
      t.integer :total_members

      t.timestamps
    end
  end
end
