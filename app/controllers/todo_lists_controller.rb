class TodoListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_list = TodoList.find(params[:id])

    if @todo_list.users.include?(current_user)
      render template: "todo_lists/show"
    else
      render text: "You're not Okay", status: 403
    end
  end
end
