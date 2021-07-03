Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root "home#index"
  get "citas", to: "citas#index", as: :citas
  get "peluqueria", to: "peluqueria#index", as: :peluqueria

  get 'salon/list'
  get 'salon/new'
  post 'salon/create'
  patch 'salon/update'
  get 'salon/list'
  get 'salon/show'
  get 'salon/edit'
  get 'salon/delete'
  get 'salon/update'

  get 'appointment/list'
  get 'appointment/new'
  post 'appointment/create'
  patch 'appointment/update'
  get 'appointment/list'
  get 'appointment/show'
  get 'appointment/edit'
  get 'appointment/delete'
  get 'appointment/update'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :salon
      resources :appointment
    end
  end
end