class TrainingController < ApplicationController
  before_action :set_training

  def index
    @trainings = Training.all
  end

  def show
  end

  def new
  end

  def create
    training = Training.new(tasks: params[:tasks], content: params[:content], limit: params[:limit], completed: params[:completed])
    if training.save
      flash[:notice] = "トレーニングスケジュールを追加しました。"
      redirect_to(training_index_path(@current_user.id))
    else
      flash[:notice] = "トレーニングスケジュールを出来ませんでした。"
      render("new")
    end
  end

  def update
    if @training.update(training_params)
      flash[:notice] = "トレーニングスケジュールを更新しました。"
      redirect_to(training_index_path(@current_user.id))
    else
      flash[:notice] = "トレーニングスケジュールを更新出来ませんでした。"
      render("show")
    end
  end

  def destroy
    if @training.destroy
      flash[:notice] = "スケジュールを削除しました。"
      redirect_to(training_index_path(@current_user.id))
    else
      flash[:notice] = "スケジュールを削除出来ませんでした。"
      render("index")
    end
  end

  def complete
    @training.completed = 1
    flash[:notice] = "トレーニングお疲れさまです。完了しました。"
    redirect_to(training_index_path(@current_user.id))
    # @training.completed = 0
    # flash[:notice] = "トレーニングが完了していません。"
    # redirect_to(training_index_path(@current_user.id))
  end

  private
  def set_training
    @training = Training.find_by(id: params[:id])
  end

  def training_params
    params.permit(:tasks, :content, :limit, :completed)
  end
end
