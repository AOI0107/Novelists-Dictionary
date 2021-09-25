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

  resources :posts, except: [:index] do
    resource :bookmarks, only: [:create, :destroy]
  end
end