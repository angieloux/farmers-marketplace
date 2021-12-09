class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :transactions
  has_one_attached :image # trigger active storage 

  validates :name, presence:true #needs to have name
  validates :price, presence:true #needs to have price

  # scope :bargains, -> {where(price: 1000)}
  scope :sold, -> { joins(:transactions)}

  # % signs allow results to be returned whether there is additional words on either side of the search query (i.e. a search of "Tuna" would return "John West Tuna cans")
  scope :search_by_name, -> (name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_category, -> (id) {where(category_id: id) }


  # name length 
  # numericality for price 
  # comment belongs_to user 
  # listing has many comments 

  def self.search(search_hash)
    p search_hash
    if search_hash
      Listing.search_by_name(search_hash["name"]).filter_by_category(search_hash["category_id"])
    else 
      Listing.all
    end
end


end
