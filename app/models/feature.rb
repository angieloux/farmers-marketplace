class Feature < ApplicationRecord
    has_many :features_listings
    has_many :listings, through: :features_listings
end
