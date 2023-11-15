FROM amirpourmand/al-folio:v0.10.1

# Overwrite upstream Gemfile.
ADD Gemfile /srv/jekyll
RUN bundle install
