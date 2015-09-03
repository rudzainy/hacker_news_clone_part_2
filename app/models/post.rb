class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments
  has_many :post_votes

  def self.check_duplicate_vote(post_id, user_id)
  	check = PostVote.find_by(post_id: post_id, user_id: user_id)

  	if check == nil
  		false
  	else
  		true
  	end
  end
end