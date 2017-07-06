class CreateUsersTodoListsJoinTable < ActiveRecord::Migration[5.0]
  create_join_table :todo_lists, :users
end
