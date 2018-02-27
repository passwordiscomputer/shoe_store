class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table(:assignments) do |t|
      t.column(:employee_id, :int)
      t.column(:project_id, :int)
      t.column(:completion, :boolean)
    end
  end
end
