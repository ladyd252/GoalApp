class UserComment < ActiveRecord::Base
  validates :author_id, :user_id, :body, presence: true

  belongs_to :user
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id
  )
end
