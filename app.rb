require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/namespace'


current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }
Dir["#{current_dir}/serializers/*.rb"].each { |file| require file }

namespace '/api/v0' do
  before do
    content_type 'application/json'
  end

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
    end

    def user_params
      {
        email: params[:email],
        password: params[:password],
        telephone_number: params[:telephone_number],
        first_name: params[:first_name],
        last_name: params[:last_name]
      }
    end

    def account_params
      {
        name: params[:name],
        card_number: params[:card_number]
      }
    end
  end

  #  START RESOURCES USERS
  get '/users' do
    users = User.all
    list = users.map { |user| UserSerializer.new(user) }
    output = {
      object: "list",
      data: list
    }
    output.to_json(account: false)
  end

  get '/users/:user_uid' do
    puts params[:uid]
    user = User.find_by(uid: params[:user_uid])
    halt(404, { message:'Can not find this user'}.to_json) unless user

    output = UserSerializer.new(user)
    output.to_json
  end

  post '/users' do
    user = User.new(user_params)
    if user.save
      status 200
      body UserSerializer.new(user).to_json
    else
      status 422
      { message: user.errors.full_messages }.to_json
    end
  end
  # RESOURCES USERS END

  # AUTH
  post '/auth' do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      status 200
      body UserSerializer.new(user).to_json
    else
      { message:'Invalid email or password' }.to_json
    end
  end

  # START RESOURCES ACCOUNTS

  post '/users/:user_uid/accounts' do
    user = User.find_by(uid: params[:user_uid])
    halt(404, { message:'Can not find this user'}.to_json) unless user

    account = user.accounts.new(account_params)
    if account.save
      status 200
      body AccountSerializer.new(account).to_json
    else
      status 422
      { message: account.errors.full_messages }.to_json
    end
  end

  get '/users/:user_uid/accounts' do
    user = User.find_by(uid: params[:user_uid])
    halt(404, { message:'Can not find this user'}.to_json) unless user

    accounts = user.accounts
    list = accounts.map { |account| AccountSerializer.new(account) }
    output = {
      object: "list",
      data: list
    }
    output.to_json
  end

  get '/users/:user_uid/accounts/:uid' do
    user = User.find_by(uid: params[:user_uid])
    halt(404, { message:'Can not find this user'}.to_json) unless user

    account = user.accounts.find_by(uid: params[:uid])
    halt(404, { message:'Can not find this account'}.to_json) unless account

    AccountSerializer.new(account).to_json
  end



  # RESOURCES ACCOUNTS END

end
