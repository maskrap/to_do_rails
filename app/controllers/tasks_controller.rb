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


# NO IDEAA WHAT I'M DOING BELOW THIS POINT

  # def edit
  #   @list = List.find(params[:id])
  #   render :edit
  # end
  # 
  # def update
  #   @list = List.find(params[:id])
  #   if @task.update(task_params)
  #     redirect_to lists_path(@task.list)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @list = List.find(params[:id])
  #   @list.destroy
  #   redirect_to lists_path
  # end


private
  def task_params
    params_require(:task).permit(:description)
  end
end
