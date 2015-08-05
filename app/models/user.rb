class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :likes, dependent: :destroy
  has_many :bookmarks # dependent destroy?

  def admin?
    role == 'admin'
  end 

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end 

  def liked_bookmarks
    Bookmark.find(likes.each {|l| l.bookmark_id})
  end

  def user_bookmarks
    bookmarks.includes(:topic)
  end

  def liked_bookmarks
    likes.includes(bookmark: :topic).map(&:bookmark)
  end
end
