User.create(:name => "Betsy", :email => "betsy@gmail.com", :password => "test")
User.create(name: "Maria", email: "maria@gmail.com", password: "test")

a = Card.create(question: "What color is orange?", answer: "orange", image: "http://www.bubblews.com/assets/images/news/769097791_1372533055.jpg")
b = Card.create(question: "Red plus yellow equals", answer: "orange", image:"http://www.bubblews.com/assets/images/news/769097791_1372533055.jpg")
c = Card.create(question: "What color name is also the name of a fruit?", answer: "orange", image:"http://www.bubblews.com/assets/images/news/769097791_1372533055.jpg")

color = Deck.create(name: "Color")
color.cards << a 
color.cards << b
color.cards << c
color.save

d = Card.create(question: "Who had a hit in the 60s with California Dreamin'?", answer: "The Mamas and the Papas", image:"http://blogs.escolaturbula.com/music-across-europe/files/2010/11/34_myths_legends_Mamas_Papas_color-copy.jpg")
e = Card.create(question: "Who had a hit in the 60s with Respect?", answer: "Aretha Franklin", image:"http://www.biography.com/imported/images/Biography/Images/Profiles/F/Aretha-Franklin-9301157-5-402.jpg")
f = Card.create(question: "Who had a hit in the 60s with Under The Boardwalk?", answer: "The Drifters", image:"http://garycape.com/images/drifterslg.jpg")
g = Card.create(question: "Who had a hit in the 60s with I'm A Believer?", answer: "The Monkees", image:"http://www.queenbeetickets.com/content/uploaded/the-monkees.jpg")

music = Deck.create(name: "Music")
music.cards += [d, e, f, g]
music.save

