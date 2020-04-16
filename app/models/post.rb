class Post < ApplicationRecord
  # delegate :name, :to => :user
  belongs_to :user
  has_many :comments
  validates :commenter, presence: true, length: { minimum: 1 }
end
