BeatHaven::Application.routes.draw do
  namespace :api do
    resources :artists, only: [:show], constraints: { id: /.+/ }
    resources :albums, only: [:show, :picture] do
      member { get :picture }
    end
    resources :search, only: [] do
      collection { get :complete; get :wtfis }
    end
  end

  match "/:path" => "application#main", constraints: { path: /.*/ }
  root to: "application#main"
end