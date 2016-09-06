class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Task updated!"
      redirect_to lists_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task deleted"
    redirect_to lists_path
  end


private
  def task_params
    params.require(:task).permit(:description)
  end
end
