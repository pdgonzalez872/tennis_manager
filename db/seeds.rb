t = Tournament.create!(name: "Roland Garros")

d = Draw.create!(name: "Main", size: 16)

t.draws << d
