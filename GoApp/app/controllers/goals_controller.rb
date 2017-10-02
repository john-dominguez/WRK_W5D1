class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new, status: 422
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy!
    redirect_to goals_url
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @goals = Goal.all
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :body, :public, :completed )
  end
end
