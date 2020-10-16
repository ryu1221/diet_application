class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録完了しました"
      redirect_to("/ranks")
    else
      flash[:notice] = "新規登録に失敗しました"
      render('new');
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end