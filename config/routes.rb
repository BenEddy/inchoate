Inchoate::Engine.routes.draw do
  get "/" => "pages#show"
  get "*path" => "pages#show"
  post "/pages" => "pages#create", as: :pages
end