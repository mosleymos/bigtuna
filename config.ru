require ::File.expand_path('../config/environment',  __FILE__)

if ENV['HTTP_AUTH_USERNAME'] && ENV['HTTP_AUTH_PASSWORD']
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == [ENV['HTTP_AUTH_USERNAME'], ENV['HTTP_AUTH_PASSWORD']]
  end
end

run BigTuna::Application
