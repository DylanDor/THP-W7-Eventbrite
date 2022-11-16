class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :welcome_send
    
    has_many :attendances, dependent: :destroy
    has_many :events, through: :attendances, dependent: :destroy
    has_many :administrated_events, foreign_key: 'admin_id', class_name: 'Event', dependent: :destroy
    has_one_attached :avatar, dependent: :destroy

    validates :email,
        presence: true,
        uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def welcome_send
    UserMailer.welcome_email(self).deliver_now
    end
end
