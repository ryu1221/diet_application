Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create] do
    get :mypage
  end
  resources :goods, only:[] do
    get :search, on: :collection
    post :search_list, on: :collection
  end
  resources :favorite, only: [:create, :destroy]
  
  get '/:genre' => 'ranks#index'
  get '/:genre/:id' => 'ranks#show'


end
