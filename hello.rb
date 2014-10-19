require 'sinatra'

load File.join(File.dirname(__FILE__), 'env.rb')

class Hello < Sinatra::Base
  get '/members.json' do  
    Bedouins.execute  
  end
end