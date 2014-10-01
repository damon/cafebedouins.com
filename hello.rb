require 'sinatra'
require 'bedouins'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
  Bedouins.execute
end