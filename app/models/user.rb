class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
 

  has_attached_file :image1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
  has_attached_file :image2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/
  has_attached_file :image3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/
  has_attached_file :image4, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image4, content_type: /\Aimage\/.*\Z/
  has_attached_file :image5, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image5, content_type: /\Aimage\/.*\Z/

  has_secure_password

  validates :name, :presence => true, :uniqueness => true, :length => { :in => 2..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true

  validates_length_of :password, :in => 6..20, :on => :create

end

