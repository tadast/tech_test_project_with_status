class ProjectActivity < ApplicationRecord
  belongs_to :project
  belongs_to :subject, polymorphic: true, optional: true
end
