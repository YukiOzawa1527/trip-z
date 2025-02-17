Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  scope module: :public do
    #homesコントローラー
    root to: "homes#top"
    get "about", to: "homes#about"
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

    #usersコントローラー
    resources :users, only: [:edit, :show, :update, :destroy]
    get "my_page", to: "users#mypage"

    #postsコントローラー
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]

    #favoretesコントローラー
    post "favorites/:id" => "favorites#create" ,as: "favorites"
    delete "favorites/:id" => "favorites#destroy"

    #messagesコントローラー
    get "users/:id/messages" => "messages#index" ,as: "messages"
    get "users/:id/messages/:id" => "messages#show"
    post "users/:id/messages" => "messages#create"
    delete "users/:id/messages/:id" => "messages#destroy"

    #relationshipsコントローラー
    get "users/:id/relationships/follower" => "relationships#follower" ,as: "follower"
    get "users/:id/relationships/followed" => "relationships#followed" ,as: "followed"
    post "users/:id/relationships" => "relationships#create" ,as: "relationships"
    delete "users/:id/relationships/:id" => "relationships#destroy"

  end

  namespace :admin do
    #homesコントローラー
    root to: "homes#top"
    get "about" => "homes#about"
    
    #postsコントローラー
    get "posts/:id" => "posts#edit"
    get "posts/:id" => "posts#update"
    get "posts/:id" => "posts#destroy"

    #usersコントローラー
    get "users" => "users#index"
    get "users/:id" => "users#edit"
    get "users/:id" => "users#update"
    get "users/:id" => "users#destroy"
  end

  get '/search', to: 'searches#search'


  
end
