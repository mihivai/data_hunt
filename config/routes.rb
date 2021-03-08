Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  get "/data-hacker", to: "pages#data_hacker", as: "data_hacker"
  get "/art-dealers", to: "pages#art_dealers", as: "art_dealers"
  get "/news-item", to: "pages#news_item", as: "news_item"
  get "/inside-clue", to: "pages#inside_clue", as: "inside_clue"
  get "/great-trip", to: "pages#great_trip", as: "great_trip"
  get "/fake-friend", to: "pages#fake_friend", as: "fake_friend"
  get "/bad-move", to: "pages#bad_move", as: "bad_move"
  get "/ultimate-shovel", to: "pages#ultimate_shovel", as: "ultimate_shovel"
  get "/final-treasure", to: "pages#final_treasure", as: "final_treasure"

  get '/legal', to: 'pages#legal', as: 'legal'
end
