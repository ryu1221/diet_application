class TrainingController < ApplicationController
  before_action :set_training
  before_action :set_training_id
  before_action :set_user

  def index
    @trainings = @user.training_index.order(limit: :asc).page(params[:page])
    training_array = []
    training_array.push(@trainings)
    @training_pagenate = Kaminari.paginate_array(training_array, total_count: 100).page(params[:page])
  end

  # def completed
  #   @trainings = @user.training_index.where("completed = 1").order(limit: :asc)
  # end

  # def in_completed
  #   @trainings = @user.training_index.where("completed = 0").order(limit: :asc)
  # end

  def show
  end

  def new
  end

  def update
    if @training.update(training_params)
      flash[:notice] = "トレーニングスケジュールを更新しました。"
      redirect_to(training_index_path)
    else
      flash[:notice] = "トレーニングスケジュールを更新出来ませんでした。"
      render("show")
    end
  end

  def is_complete
    if @training_id.completed == 0
      @training_id.completed = 1
      if @training_id.update(training_params)
        flash[:notice] = "トレーニングお疲れさまです。完了しました。"
      end
    elsif @training_id.completed == 1
      @training_id.completed = 0
      if @training_id.update(training_params)
        flash[:notice] = "トレーニングが完了していません。"
      end
    end
    redirect_to(training_index_path)
  end


  def training_events
    @trainings = @user.training_index
    respond_to do |format|
      format.any { render json: @trainings.to_json( only: [:tasks, :limit] ) }
    end
  end





  private
  def set_training
    @training = Training.find_by(id: params[:id])
  end

  def set_training_id
    @training_id = Training.find_by(id: params[:training_id])
  end

  def set_user
    @user = User.find_by(id: @current_user.id);
  end

  def training_params
    params.permit(:tasks, :content, :limit, :completed, :user_id)
  end
end
