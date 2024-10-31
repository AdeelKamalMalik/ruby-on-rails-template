class Task < ApplicationRecord
  after_save :create_notification
  belongs_to :project
  validates :name, presence: true
  enum status: { pending: 0, in_progress: 1, completed: 2 }

  private

  def create_notification
    self.project.users.each do |user|
      TaskCreatedNotifier.with(task: self, project: self.project).deliver_later(user)
    end
  end
end
