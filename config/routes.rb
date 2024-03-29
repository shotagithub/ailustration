Rails.application.routes.draw do
  devise_for :users
  root to: 'illusts#index'
  
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'show_all_illusts'
      get 'show_all_novels'
      get 'show_all_products'
    end
  end

  resources :illusts do
    resources :illust_comments, only: :create
    resources :illust_likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :novels do
    resources :novel_comments, only: :create
    resources :novel_likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  
  resources :products do
    resources :product_comments, only: :create
    resources :product_likes, only: [:create, :destroy]

    resources :orders, only: [:index, :create]
    
    collection do
      get 'search'
    end
  end

  resources :carts, only: [:create, :destroy]
  
end
