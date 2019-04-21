Rails.application.routes.draw do
  root to: 'events#index'
  get '/events', to: 'events#index'
  get '/reservations', to: 'reservation#new'
  post '/reservations',  to: 'reservation#create'
  get '/appointment_dates', to: 'appointment_dates#new'
  post '/appointment_dates', to: 'appointment_dates#create'

  resources :reservations, only: [:new, :create]
end
