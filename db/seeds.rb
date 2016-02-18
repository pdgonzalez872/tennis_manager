t = Tournament.create!(name: "Weekend Women's Tournament")

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

# populates
player_hash.each do |k, v|
  d = DrawPosition.find_by(draw_positions_number: v)
  player = Player.create!(name: k)
  d.players << player
end

w = Draw.create!(name: "Consolation", size: 16)
t.draws << w

w = Draw.create!(name: "Last Chance", size: 8)
t.draws << w

w = Draw.create!(name: "Quarter Reprieve", size: 4)
t.draws << w

w = Draw.create!(name: "Reprieve", size: 8)
t.draws << w

# Add locations
wsm = Location.create!(name:          'Westmoreland Country Club',
                       address:       'address here yeah',
                       short_letters: 'WSM')

msh = Location.create!(name:          'Michigan Shores Country Club',
                       address:       'address here yeah',
                       short_letters: 'MSH')

ns = Location.create!(name:          'North Shore Country Club',
                      address:       'address here yeah',
                      short_letters: 'NS')

sk = Location.create!(name:          'Skokie Country Club',
                      address:       'address here yeah',
                      short_letters: 'SK')

wn = Location.create!(name:          'Winnetka',
                      address:       'address here yeah',
                      short_letters: 'WN')

ssr = Location.create!(name:          'Sunset Ridge Country Club',
                       address:       'address here yeah',
                       short_letters: 'SSR')
# Allocation draw 1:
draw = Draw.find(1)

[16, 17].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  wsm.matches << match
end

[18, 19].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  msh.matches << match
end

[20, 21].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  ns.matches << match
end

[22, 23].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  ssr.matches << match
end

[24, 25].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  sk.matches << match
end

(26..31).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,12,0,0)
  match.save
  wn.matches << match
end

[8].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wsm.matches << match
end

[9].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  msh.matches << match
end

[10].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ns.matches << match
end

[11].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  ssr.matches << match
end

[12].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  sk.matches << match
end

(13..15).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,13,30,0)
  match.save
  wn.matches << match
end

(4..7).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,15,0,0)
  match.save
  wn.matches << match
end

(2..3).each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,16,30,0)
  match.save
  wn.matches << match
end

[1].each do |match_number|
  match = draw.matches.find_by(match_number: match_number)
  match.time = DateTime.new(2016,2,20,18,0,0)
  match.save
  wn.matches << match
end













# d
