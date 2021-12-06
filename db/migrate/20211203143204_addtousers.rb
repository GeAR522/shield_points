class Addtousers < ActiveRecord::Migration[6.0]
  def change
  change_table :users do |t|
    t.string :name
    t.integer :total_points
    t.integer :total_prs
  end
  end
  end
