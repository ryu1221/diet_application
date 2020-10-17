class FavoriteController < ApplicationController

  def create
    @like = Favorite.new(
      user_id: params["user_id"], 
      rank_id: params["rank_id"], 
    )
    @like.save
    flash[:notice] = "お気に入り登録しました"
    redirect_to("/rank/#{params["rank_id"]}")
  end


  def destroy
    @like = Favorite.find_by(
      user_id: params["user_id"], 
      rank_id: params["rank_id"], 
    )
    @like.destroy
    flash[:notice] = "お気に入り登録を解除しました"
    redirect_to("/ranks/#{params["rank_id"]}")
  end
end
