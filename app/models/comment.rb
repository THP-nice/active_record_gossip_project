class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_and_belongs_to_many :likes
end