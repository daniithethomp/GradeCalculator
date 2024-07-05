class AddPassToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :pass, :boolean
  end
end
