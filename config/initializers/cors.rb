# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: %i[get post put patch delete options head],
                  credentials: true
  end

  allow do
    origins 'https://gentle-fortress-16563.herokuapp.com'
    resource '*', headers: :any, methods: %i[get post put patch delete options head],
                  credentials: true
	end

  allow do
    origins 'https://laughing-fermat-5d3da8.netlify.app'
    resource '*', headers: :any, methods: %i[get post put patch delete options head],
             credentials: true
  end
end
