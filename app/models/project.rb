class Project < ApplicationRecord
  before_create :generate_invite_token

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :project_users, dependent: :destroy # Add this line
  has_many :users, through: :project_users # Add this line
  validates :name, presence: true
  validates :description, presence: true

  private

  def generate_invite_token
    self.token = SecureRandom.hex(10) # Generate a unique token
  end
end
