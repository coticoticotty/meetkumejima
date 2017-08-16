class Reservation
  include ActiveModel::Model
  
   attr_accessor :name, :email, :date, :number, :message
   
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :number, presence: true
  validates :date, presence: true
  validates :message, presence: true
end