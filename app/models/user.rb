class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  has_many :owned_lists, class_name: "List" 
  has_many :follows, dependent: :destroy 
  has_many :followed_lists, through: :follows, class_name: "List"
 
  has_attached_file :avatar,:styles => { :medium => "300x300#", :thumb => "100x100#" }, :convert_options => { :all => '-auto-orient' }, :default_url => "/public/backup.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # def follow!(list)
  # self.follows.create!(followed_list_id: list.id)
  # end

  # def unfollow!(list)
  # the_follow = self.follows.find(params[:followed_list_id])
  # the_follow.destroy!
  # end

  # def follow?(list)
  # self.follows.find(params[:followed_list_id])
  # end
  
  end
