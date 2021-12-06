class ChangePointsTables < ActiveRecord::Migration[6.0]
  def change
    change_column :points, :questions, :integer
  end
end
