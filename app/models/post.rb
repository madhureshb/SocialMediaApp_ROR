class Post < ApplicationRecord
    belongs_to :account
    
    has_many :comments
    has_many :likes
    has_one_attached :main_image

    scope :active, -> { where active: true }

end
