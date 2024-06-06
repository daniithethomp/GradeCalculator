class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.references :CourseModule, null: false, foreign_key: true
      t.string :title
      t.integer :weight
      t.decimal :achieved, precision: 10, scale: 2
      t.integer :out_of

      t.timestamps
    end
  end
end
