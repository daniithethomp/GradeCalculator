class AddWeightToYears < ActiveRecord::Migration[7.1]
  def change
    add_column :years, :weight, :decimal
  end
end
