Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'mypage', to: 'homes#mypage'
  resources :posts, only: [:create, :new, :edit, :update, :destroy]
  get '/posts/index', to:'posts#index'
  get '/posts/new', to:'posts#new'
  get '/posts/:id/edit', to:'posts#edit'
  get '/search', to: 'searchs#search'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/tags/:id', to: 'tags#show', as: 'tag'

  resources :posts, except: [:index] do
    resource :bookmarks, only: [:create, :destroy]
  end
end