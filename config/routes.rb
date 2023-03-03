Rails.application.routes.draw do
  devise_for :users
  root to: 'illusts#index'
  
  resources :users, only: [:index, :show]

  resources :illusts do
    resources :illust_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :novels do
    resources :novel_comments, only: :create
    collection do
      get 'search'
    end
  end
  
  resources :products do
    resources :product_comments, only: :create
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  
end
