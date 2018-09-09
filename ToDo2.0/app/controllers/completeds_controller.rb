class CompletedsController < ApplicationController
	before_action :authenticate_user!


  def create
    @todo = Todo.find(params[:todo_id])
  	@user = current_user
  	@task = Completed.where(:user_id => @user, :todo_id => @todo)
  	if @task.empty?
		  @completed = Completed.new(todo: @todo, user: current_user, status: true)
	  	  if @completed.save
	  		 redirect_to root_path, notice:'Estado completado'
	  	  else
	  		 redirect_to root_path, alert:"No se pudo completar" 
	  	  end
  	else
  		if Completed.where(:user_id => @user, :todo_id => @todo).update_all(:status => true)
  			redirect_to root_path, notice:'Estado Completado'
  		else
  			redirect_to root_path, alert:"No se pudo completar"	
  		end 	
	 end	
  end

  def update
  	@todo = Todo.find(params[:todo_id])
  	@user = current_user
  	  if Completed.where(:user_id => @user, :todo_id => @todo).update_all(:status => false)
  		  redirect_to root_path,notice:'Estado Corregido'
  	  else
  		redirect_to root_path, alert:"No se pudo corregir"	
  	end
  end

  def index
    @completeds=current_user.completeds
  end
end
