MoneyManager::Application.routes.draw do

  resources :categories

  root :to => "transactions#index"

  resources :transactions do
	  collection { post :import }
	end

end
