class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.references :community
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
