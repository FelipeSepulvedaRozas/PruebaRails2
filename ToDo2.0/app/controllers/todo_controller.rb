class TodoController < ApplicationController
def index
  @status = []
  @Todos = Todo.all
    if user_signed_in?
        @Status = Completed.select(:user_id, :todo_id).where(:user_id => current_user, :status => true).all
      @Status.each do |status|
        @status << status.todo_id 
      end
      @completed = @status.length
      @all = Todo.all.count
    end
  end

  def show
    @status = []
    @users = []
    @Todo= Todo.find(params[:id])
      if user_signed_in?  
        @users = User.joins(:completeds).where(completeds: {todo_id: @Todo, status: true})
        @Status = Completed.select(:user_id, :todo_id).where(:user_id => current_user, :status => true).all
        @Status.each do |status|
          @status << status.todo_id 
        end
        @completed = @status.length
        @all = Todo.all.count
        @Top = User.joins(:completeds).where(completeds: {todo_id: @Todo, status: true}).limit(5)
      end
  end
end
