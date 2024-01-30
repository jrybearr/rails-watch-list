class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  has_and_belongs_to_many :bookmarks
end
