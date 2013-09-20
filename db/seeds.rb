User.create(:name => "Betsy", :email => "betsy@gmail.com", :password_digest => "test")
User.create(name: "Maria", email: "maria@gmail.com", password_digest: "test")

a = Card.create(question: "What color is orange?", answer: "orange")
b = Card.create(question: "Red plus yellow equals", answer: "orange")
c = Card.create(question: "What color name is also the name of a fruit?", answer: "orange")

color = Deck.create(name: "Color")
color.cards << a 
color.cards << b
color.cards << c
color.save

d = Card.create(question: "Who had a hit in the 60s with California Dreamin'?", answer: "The Mamas and the Papas")
e = Card.create(question: "Who had a hit in the 60s with Respect?", answer: "Aretha Franklin")
f = Card.create(question: "Who had a hit in the 60s with Under The Boardwalk?", answer: "The Drifters")
g = Card.create(question: "Who had a hit in the 60s with I'm A Believer?", answer: "The Monkees")

music = Deck.create(name: "Music")
music.cards += [d, e, f, g]
music.save

