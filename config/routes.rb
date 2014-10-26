Rails.application.routes.draw do
  root to: "pages#home"
  get 'pages/home'

  resources :products, only: [:index, :new, :create]
    namespace :api do
      namespace :v1 do
        #products#index - admin dashboard summary
        #products#show - display product info for reviewer
        #products/reviews#create - create review info
        resources :products, only: [:show, :index] do
          resources :reviews, only: [:create]
        end
      end
    end
end
