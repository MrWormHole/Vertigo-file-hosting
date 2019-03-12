Rails.application.routes.draw do
  resources :resumes, only: [:index, :new, :create, :destroy]
  get "/pages/:page" => "pages#show"
  #get 'resumes/index'
  #get 'resumes/new'
  #get 'resumes/create'
  #get 'resumes/destroy'

  # You can define the following code on top like this but we prefer the shortest one on bottom
  # => resources :resumes,only: [:index,:new,:create,:destroy]
  root "pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
