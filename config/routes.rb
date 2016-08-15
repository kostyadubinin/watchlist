# frozen_string_literal: true
Rails.application.routes.draw do
  filter :locale

  root "movies#index"
  resources :movies, only: :index
end
