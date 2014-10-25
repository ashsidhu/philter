Rails.application.routes.draw do
  get 'pages/home'
    namespace :api do
      namespace :v1 do

      end
    end
end
