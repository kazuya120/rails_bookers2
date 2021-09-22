class Book < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  validates :title, :body, presence: true
  
  
end
