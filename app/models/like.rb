class Like < ApplicationRecord
  validates :account_id, uniqueness: { scope: :post_id }
  belongs_to :account
  belongs_to :post
end
