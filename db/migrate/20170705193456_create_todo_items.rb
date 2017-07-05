class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
      t.text :description
      t.string :summary
      t.datetime :due_date

      t.timestamps
    end
  end
end
