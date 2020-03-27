class MoviesController < ApplicationController
  def index
    # @movies=Movie.all
    if params[:search]
      @movies=Movie.where('title LIKE ?', "%#{params[:search]}%")
    else
      @movies=Movie.all
    end
  end

  def show
    @movie=Movie.find(params[:id])
  end




  private

  # def movie_params
  #   params.require(:movie).permit!
  # end

end
