require 'rails_helper'

RSpec.describe Listing, type: :model do

    it "should respond to #name" do
        listing = Listing.new
        expect(listing).to respond_to(:name)
      end

      it "should create a listing in the database" do
        user = User.create!(name: "Angela Johnson", email: "example@example.com", password: "sdfsdf")
        expect { user.listings.create!(name: "Foo", category: "Fruit", price: 2) }.to change { Listing.count }.by(1)
      end

      context "when invalid parameters are entered" do
        subject { Listing.new }
        let(:listing) { Listing.new }
    
        it "should be not be valid" do
          expect(listing).to_not be_valid # valid?
          expect(listing.errors.full_messages).to include "Name can't be blank"
    
          expect(subject).to_not be_valid # valid?
          expect(subject.errors.full_messages).to include "Price can't be blank"

          expect(subject).to_not be_valid # valid?
          expect(subject.errors.full_messages).to include "Category can't be blank"
        end
    end
    
end