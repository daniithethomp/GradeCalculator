class CreateYears < ActiveRecord::Migration[7.1]
  def change
    create_table :years do |t|
      t.integer :year_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
