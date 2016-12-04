Rails.application.routes.draw do

  get '/', to: 'users#index'
  get '/users/query', to: 'users#query', as: 'root'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'

end
