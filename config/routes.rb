Rails.application.routes.draw do
  resources :resumes, only: [:index, :new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:destroy]
  get "/pages/:page" => "pages#show"

  root "pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
