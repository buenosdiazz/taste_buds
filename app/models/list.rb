class List < ApplicationRecord
belongs_to :user
belongs_to :category
has_many :follows, dependent: :destroy 
has_many :followers, through: :follows, class_name:"User",  :source => :user
has_many :items 
end
