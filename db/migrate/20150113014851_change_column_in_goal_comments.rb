class ChangeColumnInGoalComments < ActiveRecord::Migration
  def change
    remove_column :goal_comments, :comment_id
    add_column :goal_comments, :goal_id, :integer, null: false
  end
end
