class TodoListCreatorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    10.times do
      TodoList.create(title: "New List")
      sleep 20
    end
  end
end
