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

  def create
    @todo_list = TodoList.new(todo_list_params.merge(status: 0))

    if @todo_list.save
      render json: @todo_list, status: 201
    else
      render json: { errors: @todo_list.errors }, status: 422
    end
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
