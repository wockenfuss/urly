Urly::Application.routes.draw do

  resources :users, :only => [:index, :create, :show, :new] do
    resources :urls, :only => [:index, :create, :show]
  end

  post '/login' => 'users#show', :as => 'login'
  root :to => 'users#new'

  match "*path" => 'urls#show'
end
