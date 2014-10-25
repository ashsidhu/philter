Rails.application.routes.draw do
  get 'products/new'

  get 'products/create'

  get 'pages/home'
    namespace :api do
      namespace :v1 do

      end
    end
end
