Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'polls#index' # 'application#hello'
  resources :polls do
    member do
      get :vote
      patch :submit
    end
  end
end
