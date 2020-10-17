class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:mypage]}
  before_action :forbid_login_user, {only: [:new, :create]}

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録完了しました"
      redirect_to(user_mypage_path(@user.id))
    else
      flash[:notice] = "新規登録に失敗しました"
      render('new');
    end
  end

  def mypage 
    @user = User.find_by(id: @current_user);
    @favorite_ranks = @user.favorite_ranks
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end