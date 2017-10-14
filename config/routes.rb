Rails.application.routes.draw do
  api_version module: 'Api::V1', path: {value: '/api/v1'} do
    resource :dev, controller: 'dev', only: [] do
      get :check, on: :collection
    end
    resource :config, controller: 'config', only: [:show]
    resource :auth, controller: 'auth', only: [] do
      post :login, on: :collection
      post :logout, on: :collection
    end
    resources :activities, only: [:index, :create] do
      post :check, on: :member
    end
    resources :comments, only: [:create]
    resources :users, only: [] do
      get :current, on: :collection
      put :update, on: :collection
    end
    resources :groups, only: [:index, :create, :destroy]
    resources :invites, only: [:create] do
      post :accept, on: :collection
    end
  end
end
