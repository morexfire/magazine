%w(author photographer illustrator editor publisher).each do |role|
  Role.create!(name: role)
end

placeholder_content = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

Article.create!(
  title:    "Summer Holidays vs Punk Routine",
  subtitle: "A Liberation Frequency",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "20",
  photo:    "https://farm4.staticflickr.com/3903/15161122850_fdac1c97a5_b.jpg"
)

Article.create!(
  title:    "The Only Good Fascist Is A Very Dead Fascist",
  subtitle: %q(Apparently I'm A "P.C. Facist"),
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "21",
  photo:    "https://farm4.staticflickr.com/3924/15161068809_35801aa35f_b.jpg"
)

Article.create!(
  title:    "Freedom",
  subtitle: "Darkness",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "22",
  photo:    "https://farm4.staticflickr.com/3879/15161310747_5e23c1c2f4_b.jpg"
)

Article.create!(
  title:    "Roots Radicals",
  subtitle: "I Wanna Riot",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "23",
  photo:    "https://farm4.staticflickr.com/3837/15161111170_76a5c64a2b_b.jpg"
)

Article.create!(
  title:    "Collapse (Post-Amerika)",
  subtitle: "Long Forgotten Sons",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "24",
  photo:    "https://farm4.staticflickr.com/3917/15161059929_98947c1d75_b.jpg"
)
