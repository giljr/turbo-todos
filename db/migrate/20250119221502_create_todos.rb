class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
