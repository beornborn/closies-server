Rails.application.routes.draw do
  api_version module: 'Api::V1', path: {value: '/api/v1'} do
    resource :dev, controller: 'dev', only: [] do
      get :check, on: :collection
    end
    resource :auth, controller: 'auth', only: [] do
      post :login, on: :collection
      post :logout, on: :collection
    end
    resources :activities, only: [:index, :create]
    resources :users, only: [] do
      get :current, on: :collection
    end
  end
end
