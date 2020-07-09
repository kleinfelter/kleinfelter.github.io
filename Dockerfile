FROM jekyll/jekyll:3.8.5

ENV APP_HOME /srv/jekyll
#RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install

