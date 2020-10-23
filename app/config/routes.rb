Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'ranks#index'
  resources :sessions, only: %i(new create destroy)
  resources :users, only: %i(new create) do
    get :mypage
  end
  resources :goods, only: %i() do
    get :search, on: :collection
    post :search_list, on: :collection
  end
  resources :favorite, only: %i(create destroy)
  
  get '/:genre' => 'ranks#index'
  get '/:genre/:id' => 'ranks#show'


end
