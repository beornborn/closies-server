Rails.application.routes.draw do
  api_version module: 'Api::V1', path: {value: '/api/v1'} do
    resource :auth, controller: 'auth', only: [] do
      post :login, on: :collection
    end
    resources :activities
  end
end
