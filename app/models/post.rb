class Post < ApplicationRecord
    belongs_to :account
    
    has_many :comments
    has_many :likes
    
    scope :active, -> { where active: true }

end
