Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'ranks#index'
  resources :training, only: %i(index new create destroy update show) do
    get :is_complete
    # get :completed, on: :collection
    # get :in_completed, on: :collection
  end
  resources :sessions, only: %i(new create destroy)
  resources :users, only: %i(new create) do
    get :mypage
    get :training
  end
  resources :goods, only: %i() do
    get :search, on: :collection
    post :search_list, on: :collection
  end
  resources :favorite, only: %i(create destroy)
  resources :training_log, only: %i(create destroy)
  resources :events , only: %i(index)
  
  get '/:genre' => 'ranks#index'
  get '/:genre/:id' => 'ranks#show'


end
