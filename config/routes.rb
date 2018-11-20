Rails.application.routes.draw do

  root "doctors#index"
  
  resources :patients
  resources :doctors
end