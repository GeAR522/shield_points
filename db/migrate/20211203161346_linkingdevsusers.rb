class Linkingdevsusers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.belongs_to :dev
    end
  end
end
