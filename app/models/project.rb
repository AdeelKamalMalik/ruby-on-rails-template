class Project < ApplicationRecord
  before_create :generate_invite_token

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :faqs, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  validates :name, presence: true
  validates :description, presence: true

  def send_invitation_email(user)
    token = SecureRandom.hex(10)
    update(token:)
    InvitationMailer.invite_user(user, self).deliver_now
  end

  private

  def generate_invite_token
    self.token = SecureRandom.hex(10)
  end
end
