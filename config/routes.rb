Rails.application.routes.draw do
  get '/jobs/status', to: 'upload_jobs#status'

  get '/login', to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
	get 'slack_oauth', to: 'sessions#slack_oauth'
  get 'slack/oauth/callback', to: 'sessions#slack_oauth_callback'
	post '/slack/upload', to: 'uploads#create'

  get 'welcome/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  root 'welcome#home'

  require 'sidekiq/web'
	mount Sidekiq::Web, at: "/sidekiq"

end
