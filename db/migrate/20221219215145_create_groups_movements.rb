class CreateGroupsMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_movements do |t|
      t.belongs_to :group
      t.belongs_to :movement
    end
  end
end
