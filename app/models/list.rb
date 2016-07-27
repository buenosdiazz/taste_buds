class List < ApplicationRecord
belongs_to :user
has_many :follows, dependent: :destroy 
has_many :users, through: :follows
has_many :items 
end
