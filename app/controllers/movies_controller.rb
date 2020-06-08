class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies=Movie.where('title LIKE ?', "%#{params[:search]}%")
    else
      @movies=Movie.all
    end
  end

  def show
    @movie=Movie.find(params[:id])
  end


end
