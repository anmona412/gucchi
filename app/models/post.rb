class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations

  validates :comment, presence: true 

  def self.search(search)
    if search != ""
      Post.where('comment LIKE(?)',"%#{search}%")
    else
      Post.all
    end
  end
end
