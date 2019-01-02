class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.text :text
      t.boolean :isCompleted
      t.references :project, foreign_key: true, null: false

      t.timestamps
    end
  end
end
