require 'sinatra'
require_relative 'bedouins'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
  Bedouins.execute
end
# TODO: do bedouins dynamic logic