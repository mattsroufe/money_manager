Rails.application.routes.draw do
  get "budgets/show"
  get "cashflows/index"
  resources :categories
  root :to => "transactions#index"
  resources :transactions do
    collection { post :import }
  end
end
