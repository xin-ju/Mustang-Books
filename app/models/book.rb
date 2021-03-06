# == Schema Information
#
# Table name: books
#
#  id               :bigint           not null, primary key
#  assetlabel       :string
#  author           :string
#  book_format      :string
#  genre            :string
#  image            :string
#  overview         :string
#  page_number      :integer
#  price            :float
#  publication_date :string
#  rating           :float
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Book < ApplicationRecord
    validates :author, presence: true
    validates :genre, presence: true
    validates :overview, presence: true, uniqueness: true
    validates :rating, presence: true
    validates :title, presence: true, uniqueness: true
    validates :price, presence: true
    

    has_many :reviews, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :wishlist_items, dependent: :destroy
    has_one_attached :avatar
    #has_many :order_items, dependent: :destroy


    def self.filter(filter)
        if filter and not filter.empty?
            @books = Book.all
            @books = @books.where(genre: filter)

            #byebug
            return @books
        else
            Book.all
        end 
    end
    
    #order_items not added yet to project, needed to comment above line of code out to 
    #allow seller delete product function. Delete item should continue work once order_items is added
    
end








