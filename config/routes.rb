Rails.application.routes.draw do
  resources :comments
  resources :posts do
  	member do
  		get :verify_post
      get :publish_post
    end
  end
  root "posts#index"
end
