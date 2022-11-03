Rails.application.routes.draw do
  get 'fotouser/new'
  get 'fotouser/create'
  get 'fotouser/show'
  resources :autos, only:[:create, :index, :new, :show]
  devise_for :users, :controllers => { registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/bienvenida", to: "home#index"

  get "autos/new"         => "autos#new"
  get "autos/index"         => "autos#index"

  root "home#index"
end
