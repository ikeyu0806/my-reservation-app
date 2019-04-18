Rails.application.routes.draw do
  root to: 'reservation#new'
  get '/reservations', to: 'reservation#new'
  post '/reservations',  to: 'reservation#create'
end
