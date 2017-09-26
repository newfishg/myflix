class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> {order "created_at DESC"}
  # validates :title, presence: true
  # validates :description, presence: true

  validates_presence_of :title, :description

  def self.search_by_title(query_string)
    return [] if query_string.blank?
    where("title LIKE ?", "%#{query_string}%").order("created_at DESC")
  end
end