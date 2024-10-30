class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :projects, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :invited_projects, through: :project_users, source: :project
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
end
