Rails.application.routes.draw do
  resources :balances
  get '/balances/current', to: 'balances#current'
  get '/financialStatus', to: 'balances#current'
  get '/work_pieces_of_work', to: 'work_pieces#indexWithWork'



  resources :incomes
  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :work_pieces
  resources :workers
  resources :works
  resources :employers
  resources :books
  mount_devise_token_auth_for 'User', at: 'auth', controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
