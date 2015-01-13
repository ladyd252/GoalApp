class Goal < ActiveRecord::Base
  validates :user_id, :description, presence: true
  validates :private, :completed, inclusion: [true, false]

  belongs_to :user
  has_many :goal_comments


end
