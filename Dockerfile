FROM jekyll/jekyll:4.0

ENV APP_HOME /srv/jekyll
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile

RUN bundle install
RUN bundle update
RUN echo "PATH=/usr/local/bundle/bin:/usr/local/bundle/gems/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/profile

EXPOSE 4002
