MoneyManager::Application.routes.draw do

  get "cashflows/index"
  resources :categories

  root :to => "transactions#index"

  resources :transactions do
	  collection { post :import }
	end

end
