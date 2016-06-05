Rails.application.routes.draw do

  root :to => 'welcome#index'

  namespace :admin do
    resources :families, only: [:show, :new, :edit, :create, :update, :destroy] do
      resources :supply_items, only: [:edit, :update]
    end
  end

  resources :families, only: [:index, :show] do
    resources :supply_items, only: [:edit, :update, :show]
  end


  resources :users, only: [:new, :create, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
