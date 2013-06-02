class Request < ActiveRecord::Base
  attr_accessible :requester_id, :state, :subject_id, :user_id

  belongs_to :user
  belongs_to :subject
  belongs_to :requester, :class_name => 'User'
end
