class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.integer :total_points
      t.integer :review_total
      t.integer :testing_total
      t.integer :housekeeping_total
      t.integer :productivity_total
      t.integer :meta_total

      t.timestamps
    end
  end
end
