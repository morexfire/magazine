%w(author photographer illustrator editor publisher).each do |role|
  Role.create!(name: role)
end

Article.create!(
  title:    "Summer Holidays vs Punk Routine",
  subtitle: "A Liberation Frequency",
  year:     "2014",
  month:    "10",
  day:      "20",
  photo:    "https://farm4.staticflickr.com/3903/15161122850_fdac1c97a5_b.jpg"
)

Article.create!(
  title:    "The Only Good Fascist Is A Very Dead Fascist",
  subtitle: %q(Apparently I'm A "P.C. Facist"),
  year:     "2014",
  month:    "10",
  day:      "21",
  photo:    "https://farm4.staticflickr.com/3924/15161068809_35801aa35f_b.jpg"
)

Article.create!(
  title:    "Freedom",
  subtitle: "Darkness",
  year:     "2014",
  month:    "10",
  day:      "22",
  photo:    "https://farm4.staticflickr.com/3879/15161310747_5e23c1c2f4_b.jpg"
)

Article.create!(
  title:    "Roots Radicals",
  subtitle: "I Wanna Riot",
  year:     "2014",
  month:    "10",
  day:      "23",
  photo:    "https://farm4.staticflickr.com/3837/15161111170_76a5c64a2b_b.jpg"
)

Article.create!(
  title:    "Collapse (Post-Amerika)",
  subtitle: "Long Forgotten Sons",
  year:     "2014",
  month:    "10",
  day:      "24",
  photo:    "https://farm4.staticflickr.com/3917/15161059929_98947c1d75_b.jpg"
)
