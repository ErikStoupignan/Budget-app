class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.float :amount, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
