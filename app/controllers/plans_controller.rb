class PlansController < ApplicationController

  def index
    @plans = Plan.all
    @plan = Plan.find_by(id: params[:id])
    @plan_count = Plan.all.count
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start, :end, :allday, :memo))
    if @plan.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :plans
    else
      render "new"
    end
  end

  def show
    @plan = Plan.find(params[:id])

  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :start, :end, :allday, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :plans
    else
      render "edit"
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :plans
  end
end
