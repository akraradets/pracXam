Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  authenticated :user do
    root to: 'papers#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  resources :paper_reports
  resources :user_reports
  resources :papers
  get '/papers/:id/rate', to: 'papers#getRate'
  post '/papers/:id/rate', to: 'papers#postRate'
  get '/papers/:id/like', to: 'papers#getFeedback'
  post '/papers/:id/like', to: 'papers#postFeedback'
  resources :discussions
  resources :subjects
  resources :discussion_comments
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/users/sign_out', to: 'users/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
