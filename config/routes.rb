LightsRails::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	root to: 'application#index'

  get "x10devices/new"
  get "x10devices", to: 'x10devices#index'
  post "x10devices/create"
  get "x10devices/edit/:id", to: 'x10devices#edit'
  patch "x10devices/:id", to: 'x10devices#update'
  delete "x10devices/:id", to: 'x10devices#destroy'
  get 'x10devices/:id', :to => 'x10devices#show', :as => :x10device

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :sessions, only: [:create, :show, :destroy]
      get 'users/devices', to: 'users#devices'
      get 'users/has_colors', to: 'users#has_colors'
      get 'users/has_password', to: 'users#has_password'
      post 'users/set_password', to: 'users#set_password'

      get 'colors/animations', :to => 'colors#animations'
      put 'colors/animation/:id', :to => 'colors#animation'
      put 'colors/solid', :to => 'colors#solid'

      get 'schedule', :to => 'schedule#show'
      post 'schedule', :to => 'schedule#create'
      post 'schedule/:id', :to => 'schedule#update'
      get 'schedule/:zone', :to => 'schedule#show_for_zone'

      get 'presets', :to => 'presets#show'
      post 'presets', :to => 'presets#create'
      post 'presets/:id', :to => 'presets#update'

      get 'rooms/:id', :to => 'rooms#show'
      get 'rooms', :to => 'rooms#show'
      put 'rooms/:id/:command', :to => 'rooms#command'

      put 'lights/:id/:command', :to => 'x10_devices#command'

      get 'beacons', :to => 'beacons#show'
    end
  end
end
