require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(name: :asc)
  erb :'/meetups/index'
end

get "/meetups/new" do
  if current_user
   erb :"/meetups/new"
 else
   flash[:notice] = "You need to sign in."
   redirect "/"
 end
end

get "/meetups/:id" do
  @meetup = Meetup.find(params['id'].to_i)
  @members = @meetup.users
  erb :'/meetups/show'
end

post "/new" do
  @name = params[:meetup_name]
  @description = params[:meetup_description]
  @location = params[:meetup_location]
  @creator = User.find(session[:user_id]).username

  unless @name.empty? || @description.empty? || @location.empty?
    new_meetup = Meetup.create(
    name: params[:meetup_name],
    description: params[:meetup_description],
    location: params[:meetup_location],
    creator: User.find(session[:user_id]).username
    )
    flash[:notice] = "You have succesfully created a meetup."
    redirect "/meetups/#{new_meetup.id}"
    else
      if @name.empty?
        flash[:notice] = "Please fill in a name!"
      elsif @description.empty?
        flash[:notice] = "Please fill in a description!"
      elsif @location.empty?
        flash[:notice] = "Please fill in a location!"
      end
      erb :"/meetups/new"
    end
end

post "/meetups/:id" do
  if current_user

  # if session[:user_id] != nil
    meetup = Meetup.find(params[:id].to_i)
    new_member = MembersList.new({ meetup: meetup, user: current_user })
    #new makes an object; create makes it and saves it to database
    if new_member.save
      return { member: current_user, message: "You have been added to this meetup!" }.to_json
    else
      return { message: " You've already joined this meetup!" }.to_json
    end
  else
    return { message: "Sign in to join us!"}.to_json
  end
end
