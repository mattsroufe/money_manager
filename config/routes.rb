Rails.application.routes.draw do
  get "budgets/show"
  resources :cashflows
  resources :categories
  root :to => "transactions#index"
  resources :transactions do
    collection { post :import }
  end
end
