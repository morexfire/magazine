puts "Populating licenses table..."
[
  [
    "Public Domain",
    "CC0",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "http://creativecommons.org/publicdomain/zero/1.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY",
    "Attribution",
    "http://creativecommons.org/licenses/by/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-SA",
    "Attribution Share Alike",
    "http://creativecommons.org/licenses/by-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-ND",
    "Attribution No Derivatives",
    "http://creativecommons.org/licenses/by-nd/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC",
    "Attribution Non-Commercial",
    "http://creativecommons.org/licenses/by-nc/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-SA",
    "Attribution Non-Commercial Share Alike",
    "http://creativecommons.org/licenses/by-nc-sa/4.0/"
  ],
  [
    "Some Rights Reserved",
    "CC BY-NC-ND",
    "Attribution Non-Commercial No Derivatives",
    "http://creativecommons.org/licenses/by-nc-nd/4.0/"
  ],
  [
    "All Rights Reserved",
    "&copy;",
    "",
    ""
  ],
].each do |license|
  l             = License.new
  l.name        = license.first
  l.short_code  = license[1]
  l.description = license[2]
  l.url         = license.last
  l.save!
end
puts "Populating licenses table... done."
puts


puts "Populating settings..."
[
  ["Site URL",         "http://allattacknoholdback.com" ],
  ["Site Name",        "All Attack, No Hold Back"],
  ["Site Description", "Radical politics aimed at the digerati and privileged class. Kids gloves off. Coming out swinging. Pulling no punches."],
  ["Twitter Username", "AllAttackMag"],
  ["Email",            "editor@allattacknoholdback.com"],
  ["FB app id",        "TODO"],
  ["Asset Host",       "http://assets.allattacknoholdback.com.s3.amazonaws.com/"],
].each do |setting|
  s         = Setting.new
  s.name    = setting.first
  s.content = setting.last
  s.save!
end
puts "Populating settings... done."
puts


puts "Setting content license..."
s         = Setting.new
s.name    = "License"
s.content = License.find_by(short_code: "CC BY-NC-ND").id
s.save!
puts "Setting content license... done."
puts


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


placeholder_content = "Lorem ipsum <a href='http://example.com'>dolor</a> sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."


# Placeholder Articles
puts "Creating articles..."
a = Article.create!(
  title:    "Summer Holidays vs Punk Routine",
  subtitle: "A Liberation Frequency",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "20"
)

a = Article.create!(
  title:    "The Only Good Fascist Is A Very Dead Fascist",
  subtitle: "Nailing Descartes To The Wall",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "21"
)

a = Article.create!(
  title:    "Freedom",
  subtitle: "Darkness",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "22"
)

a = Article.create!(
  title:    "Roots Radicals",
  subtitle: "I Wanna Riot",
  content:  placeholder_content,
  year:     "2014",
  month:    "10",
  day:      "23"
)

a = Article.create!(
  title:    "Collapse (Post-Amerika)",
  subtitle: "Long Forgotten Sons",
  content:  placeholder_content,
  year:     "2014",
  month:    "11",
  day:      "24"
)

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


# Placeholder Contributors
puts "Creating contributors..."
[
  "Lorem Ipsum",
  "Dolor Sit Amet",
  "Consectetur Adipisicing",
  "Elit Sed",
  "Eiusmod Tempor",
  "Incididunt Labore"
].each do |name|
  Contributor.create!(
                name: name,
                url: "http://example.com/#{name.downcase.gsub(/ /, "-")}",
                twitter: name.downcase.gsub(/ /, ""),
                bio:  placeholder_content + "\n\n" + placeholder_content
              )
end
puts "Creating contributors... done."
puts


# Link up articles/contributors/roles
puts "Add contributors to articles..."
Article.all.each do |article|
  c             = Contribution.new
  c.contributor = Contributor.all.shuffle.first
  c.role        = Role.where(name: "author").first
  c.article     = article
  c.save!
end
Article.all.each do |article|
  c             = Contribution.new
  c.contributor = Contributor.all.shuffle.first
  c.role        = Role.where(name: "photographer").first
  c.article     = article
  c.save!
end
Article.all.each do |article|
  c             = Contribution.new
  c.contributor = Contributor.all.shuffle.first
  c.role        = Role.where(name: "illustrator").first
  c.article     = article
  c.save!
end
puts "Add contributors to articles... done."
puts


# Temporary admin users
puts "Add temporary admin users..."
User.create!(name:                  "Editor in Chief",
             email:                 "editor@allattacknoholdback.com",
             password:              "gogo1234",
             password_confirmation: "gogo1234")
puts "Add temporary admin users... done."
puts
