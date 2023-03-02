class Project < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  enum :status,
    draft: "draft",
    open: "open",
    in_progress: "in_progress",
    closed: "closed",
    archived: "archived",
    prefix: true, default: :draft
end
