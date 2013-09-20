

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/profile/:id' do
  @user=User.find(session[:id])
  @rounds = @user.rounds
  @decks = Deck.all
  
  erb :profile
end

get 'deck/:id' do

  @deck = Deck.find(params[:id])
  @card = @deck.cards.sample
  # @user = User.find(session[:id])
  # @round = Round.create(user_id: @user.id, deck_id: @deck.id)
  erb :card
end  

post '/login' do
  
  @user=User.find(params[:user][:name])
  if @user
    @user.authenticate(params[:user][:name],params[:user],[:password])
    session[:id]=@user.id
    redirect "/profile/#{session[:id]}"
  else
    redirect "/"  
  end  

end  

post '/signup' do
  @user =User.create(params[:user])
  if @user
    session[:id]= @user.id
    redirect "profile/#{session[:id]}"
  else
    redirect "/"  
  end
end


