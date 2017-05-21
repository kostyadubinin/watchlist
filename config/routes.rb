# frozen_string_literal: true

Rails.application.routes.draw do
  filter :locale

  root "movies#index"

  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  resources :movies, only: :index, concerns: :paginatable
end
