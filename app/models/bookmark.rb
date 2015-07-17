class Bookmark < ActiveRecord::Base
  belongs_to :topic
    has_many :bookmarks
    has_many :likes, dependent: :destroy
end
