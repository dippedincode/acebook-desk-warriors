class Post < ApplicationRecord
  belongs_to :user

  def can_edit(post_id)
    @post = Post.find(post_id)
    posted_at = @post.created_at
    editable = (Time.now - posted_at) > 600 ? false : true
    editable ? @post.id == user.id ? true : false : false
  end
end
