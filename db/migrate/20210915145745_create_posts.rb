class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :description
      t.boolean :active, null: false, default: true
      t.references :account
      t.timestamps
    end
  end
end
