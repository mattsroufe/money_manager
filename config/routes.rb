Rails.application.routes.draw do
  get "budgets/show"
  resources :cashflows
  resources :categories
  root :to => "txns#index"
  resources :txns do
    collection { post :import }
  end
end
