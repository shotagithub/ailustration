Rails.application.routes.draw do
  devise_for :users
  root to: 'illusts#index'
  
  resources :illusts do
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
