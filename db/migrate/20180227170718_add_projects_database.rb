class AddProjectsDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table(:projects).each do |t|
      t.column(:title, :string)
    end
  end
end
