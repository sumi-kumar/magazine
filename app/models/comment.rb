class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :commentable, polymorphic: true
  belongs_to :comments, as: :commentable
end
