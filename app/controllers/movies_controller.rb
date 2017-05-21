# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Kaminari.paginate_array(
      movie_popular["results"],
      total_count: movie_popular["total_results"]
    ).page(params[:page]).per(20)
  end

  private

  def movie_popular
    @movie_popular ||= api.movie_popular(page: params[:page])
  end
end
