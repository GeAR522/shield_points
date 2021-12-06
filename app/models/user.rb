class User < ApplicationRecord

  has_many :quests
  belongs_to :dev


end
