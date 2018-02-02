require 'sinatra'
require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/' do
  'Welcome to XXX!'
end
