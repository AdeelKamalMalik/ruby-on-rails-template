class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :projects, dependent: :destroy # Projects created by the user
  has_many :project_users, dependent: :destroy # Add this line
  has_many :invited_projects, through: :project_users, source: :project # Add this line
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
end
