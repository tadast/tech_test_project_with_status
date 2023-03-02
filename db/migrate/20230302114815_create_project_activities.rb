class CreateProjectActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :project_activities do |t|
      t.references :project, null: false, foreign_key: true
      t.references :subject, polymorphic: true
      t.text :display_text

      t.timestamps
    end
  end
end
