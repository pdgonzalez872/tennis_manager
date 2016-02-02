t = Tournament.create!(name: "Roland Garros")

d = Draw.create!(name: "Main", size: 32)

t.draws << d

position_range = 32..63

player_array = [ "Carlee/Sterrett",
                 "Cunningham/Hines",
                 "Read/Watrous",
                 "Fyk/Huggins",
                 "Klaeser/Weinstein",
                 "Crane/Weitzman",
                 "Cooper/Lemme",
                 "Chircop/Turban",
                 "Kenner/Perkins",
                 "Kelly/Laing",
                 "Roeck/Violante",
                 "Laird/Peterson",
                 "Christianson/Tower",
                 "Cridland/Fleming",
                 "Bolling/Rizzolo",
                 "Anderson/Doyle",
                 "Johnson/Watkins",
                 "Montgomery/Wenzel",
                 "Parsons/Polayes",
                 "Davis/Williams",
                 "Daly/Redman",
                 "Brace/Price-Slepian",
                 "Dickholtz/Warren",
                 "Giesleman/Karaba",
                 "Lambropoulos/Malles",
                 "Chiang/Citari",
                 "Meier/Noble",
                 "Beall/Korniczky",
                 "Clingan/Vajdic",
                 "Hall/Young",
                 "Chastain/Foster",
                 "Padgitt/Sciortino" ]

player_hash = Hash[player_array.zip position_range]

player_hash.each do |k, v|
  d = DrawPosition.find_by(draw_positions_number: v)
  player = Player.create!(name: k)
  d.players << player
end
