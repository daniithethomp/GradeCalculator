class AddTargetScoreToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :target_score, :float, default: 0.0
  end
end
