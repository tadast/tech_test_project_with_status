class AddStatusToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :status, :string, default: "draft", null: false
  end
end
