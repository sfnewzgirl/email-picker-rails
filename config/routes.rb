Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'root'
  get '/users/:name/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:name', to: 'users#update'

end
