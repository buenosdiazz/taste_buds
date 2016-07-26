class List < ApplicationRecord
belongs_to :user
has_many :follows, dependent: :destroy 
has_many :followers, through: :follows, class_name: "User"
# has_and_belongs_to_many :categories
end
