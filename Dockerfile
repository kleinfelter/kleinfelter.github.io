FROM jekyll/jekyll:4.0

ENV APP_HOME /srv/jekyll
#RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/Gemfile
#ADD Gemfile.lock $APP_HOME/Gemfile.lock

RUN bundle install
RUN echo "PATH=/usr/local/bundle/bin:/usr/local/bundle/gems/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/profile


