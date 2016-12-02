Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'root'
  get '/users/query', to: 'users#query'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

end
