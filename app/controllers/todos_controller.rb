class TodosController < ApplicationController
  before_action :find_and_set_todo, only:[:show, :edit, :update, :destroy]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_param)
    if @todo.save
      redirect_to todos_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_param)
      redirect_to todos_path, notice: 'Todo was successfully updated.'
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
  def find_and_set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_param
    params.require(:todo).permit(:title, :status)
  end
end
