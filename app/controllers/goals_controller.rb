class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def show
    #TODO: Maybe remove this entirely
    @goal = Goal.find(params[:id])
    render :show
  end

  def index
    @goals = Goal.all
    render :index
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.private ||= false
    @goal.completed = false
    @goal.user = current_user
    if @goal.save
      redirect_to :back
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to :back
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    if URI(request.referrer).path.start_with?('/users/')
      redirect_to :back
    else
      redirect_to goals_url
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:description, :private, :completed)
  end
end
