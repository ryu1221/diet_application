class TrainingLogController < ApplicationController

  def create
    training = Training.new(tasks: params[:tasks], content: params[:content], limit: params[:limit], completed: params[:completed], user_id: params[:user_id])
    if training.save
      @training_log = TrainingLog.new(
        user_id: params[:user_id], 
        training_id: training.id, 
      )
      if @training_log.save
        flash[:notice] = "トレーニングスケジュールを追加しました。"
        redirect_to(training_index_path)
      end
    else
      flash[:notice] = "トレーニングスケジュールを出来ませんでした。"
      render("new")
    end
  end


  def destroy
    @training_log = TrainingLog.find_by(
      user_id: @current_user.id, 
      training_id: params[:id], 
    )
    if @training_log.destroy
      flash[:notice] = "トレーニングスケジュールを削除しました。"
      redirect_to(training_index_path)
    end
  end

end
