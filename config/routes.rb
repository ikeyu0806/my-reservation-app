Rails.application.routes.draw do
  root to: 'reservation#new'
  get '/reservations', to: 'reservation#new'
  post '/reservations',  to: 'reservation#create'
  get '/appointment_dates', to: 'appointment_dates#new'
  post '/appointment_dates', to: 'appointment_dates#create'
end
