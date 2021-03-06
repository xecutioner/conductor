Conductor::Engine.routes.draw do
  resources :scaffolds, :routes, :annotations, :statistics, :resources, :models, :app_controllers, :mailers
  resource :gemfile, :database
  
  resource :test, only: [] do
  	collection do
  		get :run
  		get :show
  	end
  end

  get "welcome/index"
  resources :fixtures, except: [:edit, :update ,:show]
  get 'fixtures/*path', to: 'fixtures#edit', constraints: { path: /.*/ }
  patch 'fixtures/*path', to: 'fixtures#update', constraints: { path: /.*/ }
  root "welcome#index"
end
