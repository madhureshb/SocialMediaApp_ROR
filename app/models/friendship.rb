class Friendship < ApplicationRecord
  belongs_to :account
  belongs_to :friend, class_name: 'Account'


  enum status: {
         pending: 0,
         accepted: 1,
         rejected: 2
    }
    
end
