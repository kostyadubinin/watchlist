# frozen_string_literal: true
class MoviesController < ApplicationController
  def index
    @movies = api.movie_popular["results"]
  end
end
