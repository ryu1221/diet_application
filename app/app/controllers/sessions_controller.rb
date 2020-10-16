class SessionsController < ApplicationController

  def new
  end

  def create 
    @user = User.find_by(email: params[:email]);
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/ranks")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      flash[:notice] = "ログインに失敗しました"
      render("new")
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/ranks")
  end
end
