Rails.application.routes.draw do
  get 'historial_usos/agregarHoras'
  resources :historial_usos
  get 'usuarios/show'
  get 'usuarios/index'
  get 'usuarios/new'
  get 'usuarios/cambiarrol'

  get 'autos/dejar'
  get 'autos/alquilar'
  get 'autos/verificarDejar'
  patch'autos/verificarDejar'
  get 'autos/mostrardocumentacion'
  get 'autos/mientrasalquiler'
  get 'autos/desbloquear'

  get 'supervisors/index'
  get 'supervisors/show'
  get 'supervisors/new'
  get 'supervisors/create'
  get 'supervisors/validar'
  get 'supervisors/desaprobar'


  resources :supervisors, only:[:create, :index, :new, :show, :validar, :desaprobar]
  resources :fotousers, only:[:create, :index, :new, :show]
  resources :autos, only:[:create, :index, :new, :show, :alquilar, :verificarDejar, :dejar, :update, :mostrardocumentacion, :mientrasalquiler, :desbloquear]
  devise_for :users, :controllers => { registrations: 'registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/bienvenida", to: "home#index"

  patch "autos/verificarDejar"     => "autos#verificarDejar"
  get "autos/verificarDejar"     => "autos#verificarDejar"

  get "autos/new"           => "autos#new"
  get "autos/index"         => "autos#index"

  get "fotousers/new"         => "fotousers#new"
  get "fotousers/index"         => "fotousers#index"

  root "home#index"
end
