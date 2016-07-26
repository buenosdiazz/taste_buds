class Follow < ApplicationRecord
belongs_to :follower_id ,class_name:"User"
belongs_to :followed_list_id, class_name: "List"
# validates :user_id, uniqueness: { scope: :list_id }

end
