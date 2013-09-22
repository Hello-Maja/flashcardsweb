# GET =================================================
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/profile/:id' do
  @user=User.find(session[:id])
  @rounds = @user.rounds.order("created_at DESC").limit(15)
  @decks = Deck.all
  erb :profile
end

# get '/feedback/:answer' do
#   @last_answer = params[:answer]
#   erb :feedback
# end 
 

get '/card' do
  @user = User.find(session[:id])
  @round = Round.find(session[:round])
  @deck_array = @round.deck_array 
  
    @int_cards = Guess.where(round_id: @round.id).map do |g|
      g.card_id
    end
    @guessed_cards = @int_cards.map do |i|
      i.to_s
    end  
  p @guessed_cards
  @available_cards = @deck_array - @guessed_cards
  p "These are available cards: #{@available_cards}"
    if @available_cards.empty? 
      @round.finish
      redirect "/profile/#{session[:id]}"
    else
      @card = Card.find(@available_cards.sample)
      erb :new_card
    end
end

# POST ================================================
post "/cardloop/:id" do

  @card= Card.find(params[:id])
  @round = Round.find(session[:round])
  @answer = @card.answer 
  guess = Guess.create(round_id: @round.id, card_id: @card.id)

    if params[:guess].downcase == @answer.downcase
      guess.correct = true
      @correctness = 'Correct!'
    else
      guess.correct = false
      @correctness = 'Wrong!'
    end

  if request.xhr?
    erb :feedback, layout: false
  else
    erb :feedback
  end
    # redirect '/card'    
end  

post "/round/card" do
  @user= User.find(session[:id])
  p params
 
  deck_id= params[:deck]
  @deck =Deck.find(deck_id)
  @round = Round.create(user_id: @user.id,deck_id: deck_id)
  session[:round] = @round.id 
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




