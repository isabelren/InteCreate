class Statement < ActiveRecord::Base
  validates :text, presence: true, length: {minimum: 5}

  belongs_to :user
end
