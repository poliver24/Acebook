class Post < ApplicationRecord
  # delegate :name, :to => :user
  belongs_to :user
end
