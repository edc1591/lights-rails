LightsRails::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :sessions, only: [:create, :show, :destroy]
    end
  end
end
