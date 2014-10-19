require 'sinatra'
require 'sinatra-index'

load File.join(File.dirname(__FILE__), 'env.rb')

class Hello < Sinatra::Base
  register Sinatra::Index
  use_static_index 'index.html'

  get '/members.json' do  
    Bedouins.execute  
  end
end