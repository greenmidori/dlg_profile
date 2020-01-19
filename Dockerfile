FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

RUN mkdir /dlg_profile
ENV APP_ROOT /dlg_profile
WORKDIR $APP_ROOT
ADD . $APP_ROOT
RUN bundle install
