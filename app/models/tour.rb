# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  duration   :string(255)
#  price      :string(255)
#  tour_image :string(255)
#  category   :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tour < ApplicationRecord
  belongs_to :user
  has_many :chatboxes
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :duration, presence: true
  validates :price, presence: true
#  validates :tour_image, presence: true
#  validates :category, presence: true
  
  mount_uploader :tour_image, ImageUploader
end
