class Project < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  has_many :project_activities, dependent: :destroy

  enum :status, {
      draft: "draft",
      open: "open",
      in_progress: "in_progress",
      closed: "closed",
      archived: "archived",
    },
    prefix: true, default: :draft

  def status_change_message
    return nil unless status_previous_change
    "changed status from #{status_previous_change.map(&:humanize).join(" to ")}."
  end
end
