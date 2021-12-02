class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :name, presence:true #needs to have name
  validates :price, presence:true #needs to have price
end
