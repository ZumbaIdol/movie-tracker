class MovieTracker < ActiveRecord::Base

    belongs_to :user
    validates :title, :category, :rating, presence: true
    validates :title, length: { minimum: 3 }
end
