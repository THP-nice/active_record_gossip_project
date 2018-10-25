class Like < ApplicationRecord
  has_and_belongs_to_many :gossips
  has_and_belongs_to_many :users
  has_and_belongs_to_many :comments
end