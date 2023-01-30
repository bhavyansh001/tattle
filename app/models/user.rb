class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  has_many :messages

  VALID_STATUSES = ['public', 'private']
  validates :status, inclusion: { in: VALID_STATUSES }
  
  scope :all_except, -> (user) { where.not(id: user.id)}
  scope :all_public, -> { where(status: 'public')}

  after_commit :add_default_avatar, on: [:create, :update]

  def username
    self.email.split('@')[0].capitalize
  end

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [30, 30]).processed
  end

 private
  def add_default_avatar
    return if avatar.attached?
    avatar.attach(
      io: File.open(Rails.root.join(
        'app', 'assets', 'images', 'default_avatar.png'
        )),
      filename: 'default_avatar.png',
      content_type: 'image/png'
    )
  end
end