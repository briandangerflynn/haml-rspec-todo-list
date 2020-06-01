class TodosController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @list
    end
  end

  def update
    @list = List.find(params[:list_id])
    @todo = Todo.find(params[:id])
    
    if @todo.update(todo_params)
      redirect_to @list
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to @list
  end

  private

  def todo_params
    params.permit(:task, :completed, :list_id)
  end
end