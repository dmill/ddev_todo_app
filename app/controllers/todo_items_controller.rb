class TodoItemsController < ApplicationController

  layout "items"

  def index
    @todo_items = TodoList.find(params[:todo_list_id]).todo_items
    filtered_items
  end

  def show
    @todo_item = TodoItem.find(params[:id])
  end

  private

  def filtered_items
    @todo_items = status_filtered if params[:status]
    @todo_items = max_desc_length_filtered if params[:max_desc_length]
    @todo_items
  end

  def status_filtered
    @todo_items.where(status: params[:status])
  end

  def max_desc_length_filtered
    @todo_items.where("LENGTH(description) < ?", params[:max_desc_length])
  end
end
