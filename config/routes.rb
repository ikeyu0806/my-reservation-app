Rails.application.routes.draw do
  root to: 'reservation#new'
  resources :reservations
end
