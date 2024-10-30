class Faq < ApplicationRecord
  belongs_to :project
  after_save :create_notification
  validates :question, presence: true
  validates :answer, presence: true

  private

  def create_notification
    self.project.users.each do |user|
      FaqCreatedNotifier.with(faq: self, project: self.project).deliver_later(user)
    end
  end
end
