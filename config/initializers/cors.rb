Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "###FRONT_END_URL###", "localhost:5173"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end
