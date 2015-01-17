text_about = %q{
The political discussions that inform and define our lives have become mired in
passivity, shaped by the protection of our first world privileges, and
generally ignore the anger and discontent that lie deep within us. This _____
has lead to half-measures and tempered voices that avoid confrontation for the
sake of polite discourse and retaining the illusory calm that maintains order
and business as usual.

<b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b> is not a voice of calm. It is not a plea for peace
and measured reservation. It is genuine hostility and a deliberate increase in
volume of radical voices, giving permissiveness (???) to those of us ready to
let loose through both word and deed. More than just anger for anger’s sake,
however, <b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b> is perspective born through countless
years of skepticism, informed research and discussion from our various
positions on the social pyramid of hierarchy and privilege, and the trial and
error of alternative ways of being (??? being... living? I dont know).

To be succinct, <b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b> is pissed off and we aren’t going
to be quiet about it. We see clearly that our dominant culture is driving us
towards increasingly catastrophic moments where those on the bottom suffer the
longest. We see clearly that everything is going to shit, and although we
acknowledge our privileges, stand amongst A-List celebrities, and reap the
benefits of first-world creature comforts, it doesn’t change the fact that
everything is still going to shit. We’re calling it all out for what it truly
is, (hopefully) intelligently, but (always) unapologetically.

Don’t say we didn’t warn you.
}

text_support = %q{
We navigate through a world of contradictions and the
<b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b>
project is no different. We adamantly oppose Capitalism, but find ourselves at
it’s mercy, asking others for monetary support. After all, we still need to keep
the wireless bill paid. We speak out against authority, skewer pop culture, and
reject common ideas of property and progress, and yet, find it difficult to
establish alternatives in meaningful, rewarding and sustainable ways. <b class="aanhb">All
Attack, No Hold Back</b> recognizes these inconsistencies and contradictions,
then navigates through them as best we can, with the hope that our ultimate
offering opens up the space in our discussions and lives to establish those
necessary alternatives we seek through attacking dominant culture.

With that said, there are lines to be drawn. In an attempt to reject the
commodification of, well, everything, <b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b> will never
accept advertising money, and we’ll never build a paywall to keep borders around
ideas. The push for a new existence will not be attained through secrets,
whispers, and intellectual property, therefore, the ideas and expressions we
offer will remain as accessible to you as they are to us.

There is still, however, that wireless bill to be paid…not to mention the
wireless bills of our authors. With that in mind, we are asking your financial
support in hoping to keep the spirit of <b class="aanhb">All&nbsp;Attack,&nbsp;No&nbsp;Hold&nbsp;Back</b> flourishing,
allowing us the time and space to expand upon our ideas and expressions, to
spread inflammatory rhetoric like wildfires, to reach deeper into that personal
space that harbors our discontent and set it free. To be succinct, we need your
help to attack.

Our editorial organization is carving out the personal space to find time on the
intellectual and emotional front lines of attack, and though we don’t all have
this opportunity, financial contributions will help keep our collective ideas
spreading, enable authors and editors to put in the necessary work that
comprises radical social change, and keep that connection to the world strong.
Don’t belabor your current predicament that may seem rife with more political
contradictions than you care to admit, whether you are confined to looking at
graphs and statistics on a computer screen all day or worn thin from the
physically demanding work of repetitive labor, your contributions are crucial to
keeping the radical fires burning bright.

We humbly ask you to consider supporting our project, to play a fundamental role
in keeping our ideas on the offensive, to help us initiate attacks where we can
all take part directly.

<q>The freest individual is the one with nothing left to lose.</q>
}

text_support_short = %q{
<b class="aanhb">No ads. No Paywall. Ever.</b> That&rsquo;s the promise. We will never sell
you out to advertisers or cops. We will only ever make money by selling
<i> to you </i> : weekly / monthly ebooks and print-on-demand monthly collections.

In addition to collect editions, we ask for your direct financial support.
We can&rsquo;t do this without your help. If you think that this magazine
existing is a good resource freely available to everyone, share this with
your friends and enemies. If you also have some money to spare, please
<b class="aanhb"> <a href="/support" rel="payment">send some of it our way. &rarr;</a> </b>
}



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
{
  # Site Settings
  "Site URL"           => "http://allattacknoholdback.com",
  "Site Name"          => "All Attack, No Hold Back",
  "Site Description"   => "Radical politics aimed at the digerati and privileged class. Kids gloves off. Coming out swinging. Pulling no punches.",
  "Text About"         => text_about.gsub(  /\n\n/, "@@@").gsub(/\n/, " ").gsub(/@@@/, "\n\n"),
  "Text Support"       => text_support.gsub(/\n\n/, "@@@").gsub(/\n/, " ").gsub(/@@@/, "\n\n"),
  "Text Support Short" => text_support_short.gsub(/\n\n/, "@@@").gsub(/\n/, "").gsub(/@@@/, "\n\n"),

  # Social Settings
  "Email"            => "editor@allattacknoholdback.com",
  "Twitter Username" => "AllAttackMag",
  "FB app id"        => "TODO",

  # Misc Settings
  "Asset Host"       => "http://assets.allattacknoholdback.com/",
  "Start Year"       => "2015",
  "Start Month"      => "01",
}.each do |name, content|
  s         = Setting.new
  s.name    = name
  s.content = content
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
  year:     "2015",
  month:    "01",
  day:      "01",
  status:   "published"
)

a = Article.create!(
  title:    "The Only Good Fascist Is A Very Dead Fascist",
  subtitle: "Nailing Descartes To The Wall",
  content:  placeholder_content,
  year:     "2015",
  month:    "01",
  day:      "02",
  status:   "published"
)

a = Article.create!(
  title:    "Freedom",
  subtitle: "Darkness",
  content:  placeholder_content,
  year:     "2015",
  month:    "01",
  day:      "03",
  status:   "published"
)

a = Article.create!(
  title:    "Roots Radicals",
  subtitle: "I Wanna Riot",
  content:  placeholder_content,
  year:     "2015",
  month:    "01",
  day:      "04",
  status:   "published"
)

a = Article.create!(
  title:    "Collapse (Post-Amerika)",
  subtitle: "Long Forgotten Sons",
  content:  placeholder_content,
  year:     "2015",
  month:    "01",
  day:      "05",
  status:   "published"
)

a = Article.create!(
  title:    "This is a Draft Article",
  subtitle: "You Shouldn't See It at /YYYY/MM/DD URL",
  content:  "<p><b>You should only see it at /drafts/fb72809ee9d7c71225816fd24fc27497</b></p>\n\n" + placeholder_content,
  year:     "2015",
  month:    "01",
  day:      "10"
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


# Set status to published
puts "Publishing articles..."
Article.all.each do |article|
  unless article.title.downcase =~ /draft/
    article.  publish!
  end
end
puts "Publishing articles... done."
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
