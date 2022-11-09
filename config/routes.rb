Rails.application.routes.draw do
  resources :historial_usos
  get 'usuarios/show'
  get 'usuarios/index'
  get 'usuarios/new'

  get 'autos/dejar'
  get 'autos/alquilar'

  get 'supervisors/index'
  get 'supervisors/show'
  get 'supervisors/new'
  get 'supervisors/create'
  get 'supervisors/validar'


  resources :supervisors, only:[:create, :index, :new, :show, :validar]
  resources :fotousers, only:[:create, :index, :new, :show]
  resources :autos, only:[:create, :index, :new, :show, :alquilar, :dejar, :update]
  devise_for :users, :controllers => { registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/bienvenida", to: "home#index"



  get "autos/new"         => "autos#new"
  get "autos/index"         => "autos#index"

  get "fotousers/new"         => "fotousers#new"
  get "fotousers/index"         => "fotousers#index"

  root "home#index"
end
