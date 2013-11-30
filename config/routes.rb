LightsRails::Application.routes.draw do

  get "x10devices/new"
  get "x10devices", to: 'x10devices#index'
  post "x10devices/create"
  get "x10devices/edit/:id", to: 'x10devices#edit'
  patch "x10devices/edit/:id", to: 'x10devices#update'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :sessions, only: [:create, :show, :destroy]
      get 'users/devices', to: 'users#allowed_devices'
    end
  end
end
