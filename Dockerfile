FROM ruby:3.1.2

WORKDIR /N-Common-Word-Sequences
COPY . /N-Common-Word-Sequences

RUN gem install bundler
RUN bundle

CMD ["ruby", "lib/run.rb", "texts/moby-dick.txt", "texts/brothers-karamazov.txt"]