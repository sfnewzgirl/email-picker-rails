Rails.application.routes.draw do

  get '/', to: 'users#index', as: 'root'

end
