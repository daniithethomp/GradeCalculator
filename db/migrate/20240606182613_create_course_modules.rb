class CreateCourseModules < ActiveRecord::Migration[7.1]
  def change
    create_table :course_modules do |t|
      t.references :year, null: false, foreign_key: true
      t.string :title
      t.integer :credits

      t.timestamps
    end
  end
end
