class AddDefaultFalseTests < ActiveRecord::Migration[7.1]
  def change
    change_column :tests, :pass, :boolean, default: false
    change_column :tests, :is_threshold, :boolean, default: false
  end
end
