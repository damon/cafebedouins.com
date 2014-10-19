require 'sinatra'

load File.join(File.dirname(__FILE__), 'env.rb')

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
  Bedouins.execute
end

get '/members.json' do
  "{\"members\":[{\"name\":\"Mayer Seidman\",\"image_url\":\"http://pbs.twimg.com/profile_images/481833987430551552/oUzvpgPm_bigger.jpeg\",\"screen_name\":\"MayerSeidman\"}]}"
end
