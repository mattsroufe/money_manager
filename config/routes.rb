MoneyManager::Application.routes.draw do
  get "categories/index"
  get "categories/new"

  root :to => "transactions#index"

  resources :transactions do
	  collection { post :import }
	end

end
