t = Tournament.create!(name: "Roland Garros")

d = Draw.create!(name: "Main", size: 32)

t.draws << d
