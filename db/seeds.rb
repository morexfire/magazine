# don't set published_at for new records
Article.skip_callback(:create, :before, :set_published_at_attrs)


# Roles and Things
puts "Creating roles..."
{
  author:       "word",
  photographer: "photo",
  illustrator:  "illustration",
  editor:       "edit"
}.each do |role, thing|
  Role.create!(name: role, thing: thing)
end
puts "Creating roles... done."
puts


placeholder_content = "Lorem ipsum dolor sit amet, consectetur
                       adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                       dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                       exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                       Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                       dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
                       non proident, sunt in culpa qui officia deserunt mollit anim id est
                       laborum."


# Placeholder Articles
puts "Creating articles..."
a = Article.create!(
  title:    "Summer Holidays vs Punk Routine",
  subtitle: "A Liberation Frequency",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "20",
  photo:    "https://farm4.staticflickr.com/3903/15161122850_fdac1c97a5_b.jpg"
)
puts "  #{a.name}"

a = Article.create!(
  title:    "The Only Good Fascist Is A Very Dead Fascist",
  subtitle: %q(Apparently I'm A "P.C. Facist"),
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "21",
  photo:    "https://farm4.staticflickr.com/3924/15161068809_35801aa35f_b.jpg"
)
puts "  #{a.name}"

a = Article.create!(
  title:    "Freedom",
  subtitle: "Darkness",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "22",
  photo:    "https://farm4.staticflickr.com/3879/15161310747_5e23c1c2f4_b.jpg"
)
puts "  #{a.name}"

a = Article.create!(
  title:    "Roots Radicals",
  subtitle: "I Wanna Riot",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "23",
  photo:    "https://farm4.staticflickr.com/3837/15161111170_76a5c64a2b_b.jpg"
)
puts "  #{a.name}"

a = Article.create!(
  title:    "Collapse (Post-Amerika)",
  subtitle: "Long Forgotten Sons",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "24",
  photo:    "https://farm4.staticflickr.com/3917/15161059929_98947c1d75_b.jpg"
)
puts "  #{a.name}"

puts "Creating articles... done."
puts


# Set published_at dates
puts "Setting published_at for articles..."
Article.all.each do |article|
  article.published_at = Date.parse("#{article.year}-#{article.month}-#{article.day}")
  article.save!
end
puts "Setting published_at for articles... done."
puts


# Placeholder People
puts "Creating people..."
[
  "Lorem Ipsum",
  "Dolor Sit Amet",
  "Consectetur Adipisicing",
  "Elit Sed",
  "Eiusmod Tempor",
  "Incididunt Labore"
].each do |name|
  Person.create!(name: name,
                 url: "http://example.com/#{name.downcase.gsub(/ /, "-")}",
                 twitter: name.downcase.gsub(/ /, ""))
end
puts "Creating people... done."
puts


# Link up articles/people/roles
puts "Add contributors to articles..."
Article.all.each do |article|
  c = Contribution.new
  c.person  = Person.all.shuffle.first
  c.role    = Role.where(name: "author").first
  c.article = article
  c.save!
end
Article.all.each do |article|
  c = Contribution.new
  c.person  = Person.all.shuffle.first
  c.role    = Role.where(name: "photographer").first
  c.article = article
  c.save!
end
Article.all.each do |article|
  c = Contribution.new
  c.person  = Person.all.shuffle.first
  c.role    = Role.where(name: "illustrator").first
  c.article = article
  c.save!
end
puts "Add contributors to articles... done."
puts
