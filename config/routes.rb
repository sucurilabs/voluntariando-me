VoluntariandoMe::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  match "/neighborhoods/list(.:format)" => "neighborhoods#list", :as => :list_neighborhoods
  resources :home
  resources :events do
    member do
      post :join
      delete :leave
      get :participants
    end
  end
  root :to => 'home#index'
end
