require 'sinatra'

load File.join(File.dirname(__FILE__), 'env.rb')

class Hello < Sinatra::Application
  get '/' do
    send_file File.join(settings.public_folder, 'index.html')
  end
  get '/members.json' do  
    Bedouins.execute  
  end
end