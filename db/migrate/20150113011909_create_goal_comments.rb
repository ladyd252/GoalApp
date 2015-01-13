class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :comment_id, null: false
      t.text :body, null: false
      t.integer :author_id, null: false
      t.timestamps null: false
    end
  end
end
