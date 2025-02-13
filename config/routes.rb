Discourse::Application.routes.append do
    get "/messages-broadcaster" => "message#index"
    post "/messages-broadcaster" => "message#create"
  end
  