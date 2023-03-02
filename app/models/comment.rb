class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :body, presence: true
  after_save :record_project_activity

  private

  def record_project_activity
    project.project_activities.create!(subject: self)
    project.touch
  end
end
