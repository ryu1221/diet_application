Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/:genre' => 'ranks#index'
  get '/:genre/:id' => 'ranks#show'

  resources :users, only:[:new, :create]


end
