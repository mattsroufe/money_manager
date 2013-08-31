MoneyManager::Application.routes.draw do
  root :to => "transactions#index"

  resources :transactions do
	  collection { post :import }
	end

end
