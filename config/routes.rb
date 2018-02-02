# frozen_string_literal: true

# TODO: Disable Clearance routes and take full control over routing and URL design.
Rails.application.routes.draw do
  filter :locale

  root "movies#index"

  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  resources :movies, only: :index, concerns: :paginatable
end
