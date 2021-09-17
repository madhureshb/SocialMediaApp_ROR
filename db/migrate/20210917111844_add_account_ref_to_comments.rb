class AddAccountRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :account, null: false, foreign_key: true
  end
end
