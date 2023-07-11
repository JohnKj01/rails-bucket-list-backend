Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://front-q8u9iaboo-kelvinkirui.vercel.app'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options], credentials: true
  end
end
