class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    
before_action :all_tasks, only: [:index, :create, :update,:destroy]

  # GET /tasks
  # GET /tasks.json

  def index
  @tasks = Task.all

  respond_to do |format|
    format.html
    format.js
  end
end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_to do |format|
    format.html
    format.js
  end
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_to do |format|
    format.html
    format.js
  end
  end

  # GET /tasks/1/edit
  

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create(task_params)

    respond_to do |format|
    format.html
    format.js
  end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update_attributes(task_params)
    respond_to do |format|
    format.html
    format.js
  end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    
    def all_tasks
      @tasks=Task.all
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description)
    end
end
