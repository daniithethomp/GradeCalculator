class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.references :course_module, null: false, foreign_key: true
      t.integer :max_score
      t.float :earned_score
      t.boolean :is_threshold
      t.float :weight

      t.timestamps
    end
  end
end
