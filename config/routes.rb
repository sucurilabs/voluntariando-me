VoluntariandoMe::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :home
  resources :events do
    member do
      post :join
      delete :leave
    end
  end
  root :to => 'home#index'
end
