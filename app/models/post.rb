class Post < ApplicationRecord
    belongs_to :account
    default_scope {order(created_at: :desc)}
    has_many :comments
    has_many :likes
    has_one_attached :main_image

    scope :active, -> { where active: true }
    validates_length_of :description, :maximum => 150



end
