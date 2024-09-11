Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  resources :patients
  resources :appointments, only: [:create, :index, :show, :update, :destroy]
  resources :xrays
  resources :retratamientos
end
