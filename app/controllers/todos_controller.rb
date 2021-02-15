class TodosController < ApplicationController

  def index
    @todos = Todo.all.includes(:items)
    render json: @todos
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @user
    else
      render error: { error: 'Unable to create Todo' }, status: 400
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo
      @todo.update(todo_params)
      render json: { message: 'created Todo' }, status: 200
    else
      render error: { error: 'Unable to update Todo' }, status: 400
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: { message: 'Deleted Todo' }, status: 200
    else
      render error: { error: 'Unable to delete Todo' }, status: 400
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
