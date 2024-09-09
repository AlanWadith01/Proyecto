Rails.application.routes.draw do
  post 'login', to: 'auth#login'
  resources :patients
  resources :appointments
  resources :xrays

  # Opcional: Si quieres anidar recursos
  # resources :patients do
  #   resources :appointments
  #   resources :xrays
  # end
end
