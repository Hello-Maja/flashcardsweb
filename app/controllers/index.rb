

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

get '/card' do
  @user = User.find(session[:id])
  @round = Round.find(session[:round])

  @deck_array = @round.deck_array 
  
  @guessed_cards = Guess.where(round_id => @round.id).map do |g|
    g.card_id
  end

  @available_cards = @deck_array - @guessed_cards
  
  if @available_cards.empty? 
    redirect '/profile/#{session[:id]}'
  else
    @card = Card.find(@available_cards.sample)
    erb :new_card
  end
end


post "/cardloop/:id" do
  @card= Card.find(params[:id])
  @round =Round.find(session[:round])
  
  if params[:guess].downcase == @card.answer.downcase
    Guess.create(round_id: @round.id, card_id: @card.id, correct: true)
  else
    Guess.create(round_id: @round.id, card_id: @card.id, correct: false)
  end
    
    

  redirect '/card'  
  
end  
  


post "/round/card/:id" do
  @user= User.find(session[:id])
  @card= Card.find(params[:id])
  deck_id= card.deck_id
  @round = Round.create(user_id: @user.id,deck_id: deck_id)
  session[:round] = @round.id 

  if params[:guess].downcase == @card.answer.downcase
    Guess.create(round_id: @round.id, card_id: @card.id, correct: true)
  else
    Guess.create(round_id: @round.id, card_id: @card.id, correct: false)
  end
  redirect '/card'
end

post '/login' do
  
  @user=User.find_by_email(params[:user][:email])
  p @user.password
  p params[:user][:password]

    if @user.password == params[:user][:password]
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


