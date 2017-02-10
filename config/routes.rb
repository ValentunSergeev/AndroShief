Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:      'overrides/registrations',
    sessions:           'overrides/sessions'
  }

  mount_devise_token_auth_for 'Admin', at: 'admin_auth', skip: [:registrations]


  resources :recipies, defaults: { format: :json } do
    member do
      get 'like'
      get 'dislike'
    end

    collection do
      post 'search'
    end

    resources :comments, defaults: { format: :json }
  end

  resources :ingredients, defaults: { format: :json } do
    collection do
      post 'search'
    end
  end

  resources :categories, defaults: { format: :json } do

    collection do
      post 'search'
    end
  end

  root 'recipies#index', defaults: { format: :json }

  get '/cookbook', to: 'application#cookbook', as: :cookbook, defaults: { format: :json }
end
