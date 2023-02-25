Rails.application.routes.draw do
  devise_for :users
  root to: 'illusts#index'
  
  resources :illusts do
    resources :illust_comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :novels do
    collection do
      get 'search'
    end
  end
  
  resources :products do
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end
end
