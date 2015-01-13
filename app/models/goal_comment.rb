class GoalComment < ActiveRecord::Base
  validates :author_id, :goal_id, :body, presence: true

  belongs_to :goal
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id
  )
end
