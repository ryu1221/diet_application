class SessionsController < ApplicationController
  before_action :authenticate_user, {only: [:destroy]}
  before_action :forbid_login_user, {only: [:new, :create]}

  def new
  end

  def create 
    @user = User.find_by(email: params[:email]);
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to(user_mypage_path(@user.id))
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      flash[:notice] = "ログインに失敗しました"
      render("new")
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to(new_session_path)
  end
end
