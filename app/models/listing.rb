class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :transactions
  has_one_attached :image # trigger active storage 
  has_many :features_listings, dependent: :destroy
  has_many :features, through: :features_listings

  before_validation :convert_price_to_cents, if: :price_changed?
  before_save :remove_whitespace
  validates :name, presence:true # needs to have name
  validates :price, presence:true # needs to have price

  scope :sold, -> { joins(:transactions)}

  # % signs allow results to be returned whether there is additional words on either side of the search query (i.e. a search of "Tuna" would return "John West Tuna cans")
  scope :search_by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_category, -> (id) {where(category_id: id) }

  # name length 
  # numericality for price 
  # comment belongs_to user 
  # listing has many comments 

  def self.search(search_hash)
    if search_hash
      if search_hash["category_id"] == ""
        Listing.search_by_name(search_hash["name"])
      else
        Listing.search_by_name(search_hash["name"]).filter_by_category(search_hash["category_id"])
      end   
    else 
      Listing.all
    end
end

def convert_price_to_cents 
  self.price = (self.attributes_before_type_cast["price"].to_f * 100).round
end 

def remove_whitespace 
  self.name = self.name.strip
  self.description = self.description.strip
end 

end
