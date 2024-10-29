class Faq < ApplicationRecord
  belongs_to :project

  validates :question, presence: true
  validates :answer, presence: true
end
