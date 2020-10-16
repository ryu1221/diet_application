class RanksController < ApplicationController
  
  def index

    genre = Rank::GENRES
    @rankings = RakutenWebService::Ichiba::Genre[genre[:"#{params[:genre]}"]].ranking.page(params[:page])
    
    ranking_array = []
    @rankings.each do |ranking|
      rank = Rank.new(
        rank: ranking["rank"], 
        itemName:ranking["itemName"], 
        itemPrice:ranking["itemPrice"], 
        itemCaption:ranking["itemCaption"], 
        reviewAverage:ranking["reviewAverage"], 
        mediumImageUrls:ranking["mediumImageUrls"][0], 
        itemUrl: ranking["itemUrl"],
        genre: "#{params[:genre]}"
      );

      rank.save
      ranking_array.push(rank)
    end

    @rankings = Kaminari.paginate_array(ranking_array, total_count: 100).page(params[:page])
    @item = Rank.find_by(genre: params[:genre])
  end
end
