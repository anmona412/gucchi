class PostsTag
  include Virtus.model
  include ActiveModel::Model
  attr_accessor :comment, :user_id, :category_id, :name


  with_options presence: true do
    validates :comment
    with_options numericality: { other_than: 1 } do
      validates :category_id
    end
  end

  def save
    post = Post.create(
      user_id: user_id,
      comment: comment,
      category_id: category_id,
    )
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

  def update
    
  end

  private

end