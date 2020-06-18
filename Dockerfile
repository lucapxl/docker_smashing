FROM ruby:alpine
LABEL Luca Sari 

RUN apk update 
RUN apk add nodejs bash libxml2 git patch g++ make
RUN gem update --system
RUN gem install bundler smashing
COPY run.sh /
COPY Gemfile /

RUN mkdir /smashing && \
    smashing new smashing && \
    cp /Gemfile /smashing/ && \
    cd /smashing && \
    bundle && \ 
    bundle install 

VOLUME ["/smashing"]

ENV PORT 3030
EXPOSE $PORT

WORKDIR /smashing
CMD ["/run.sh"]
