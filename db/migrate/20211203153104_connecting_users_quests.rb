class ConnectingUsersQuests < ActiveRecord::Migration[6.0]
  def change
    change_table :quests do |t|
      t.belongs_to :user
    end
  end
end
