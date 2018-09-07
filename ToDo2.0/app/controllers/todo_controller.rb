class TodoController < ApplicationController
def index
     @status = []
  	@Todos = Todo.all
    if user_signed_in?
      @Status = Completed.select(:user_id, :todo_id).where(:user_id => current_user, :status => true).all
      @Status.each do |status|
        @status << status.todo_id 
      end
      @completes = @status.length
      @total = Todo.all.count
    end

  end

  def show
    @done = []
    @users = []
    @Todo= Todo.find(params[:id])
    if user_signed_in?  
      @users = User.joins(:completeds).where(completeds: {todo_id: @Todo, status: true})
       @Status = Completed.select(:user_id, :todo_id).where(:user_id => current_user, :status => true).all
      @Status.each do |status|
        @status << status.todo_id 
      end
      @completes = @status.length
      @total = Todo.all.count


      @Top5 = User.joins(:completeds).where(completeds: {todo_id: @Todo, status: true}).order('updated_at').limit(5)
    end
  end

  def todos_params
      params.require(:todo).permit(:name, :description, :photo)
  end

end
