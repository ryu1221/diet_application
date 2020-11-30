class EventsController < ApplicationController
  before_action :set_user

  def index
    @trainings = @user.training_index.where(completed: 1)
  end

  private
  def set_user
    @user = User.find_by(id: @current_user.id);
  end
end
