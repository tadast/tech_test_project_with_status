class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title, null: false, title: ""

      t.timestamps
    end
  end
end
