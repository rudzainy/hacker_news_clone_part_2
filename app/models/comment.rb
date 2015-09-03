class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post
  has_many :comment_votes

  def self.check_duplicate_vote(comment_id, user_id)
  	check = CommentVote.find_by(comment_id: comment_id, user_id: user_id)

  	if check == nil
  		false
  	else
  		true
  	end
  end
end
