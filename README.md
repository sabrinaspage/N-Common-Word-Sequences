# Challenge by New Relic

Table of Contents
- [Challenge by New Relic](#challenge-by-new-relic)
  - [Prereqs](#prereqs)
  - [Install](#install)
  - [Docker](#docker)
  - [How to Run Program](#how-to-run-program)
  - [How to Run Tests](#how-to-run-tests)
  - [What's Next?](#whats-next)
  - [Bugs](#bugs)

## Prereqs

`~> ruby 3.1.2`
`~> bundler 2.2.3`

## Install

run `git clone https://github.com/sabrinaspage/N-Common-Word-Sequences` in your terminal.
enter the directory with `cd N-Common-Word-Sequences`.
run `bundle` to make sure you have all the needed gems.

## Docker

We have dockerized this project so that all of our dependencies are written in code.

Build the Docker image with: `docker build -t new-relic-practice`

Run the Docker image with: `docker run -it new-relic-practice`

**NOTE:** If it doesn't work, you may need to update the `WORKDIR` and `COPY` directories to the root directory of this project.

## How to Run Program

Run `ruby lib/run.rb` and add the relative path to the file(s) (i.e. `texts/moby-dick.txt`) as input.

## How to Run Tests

Run `bundle exec rspec` for all tests.

Run `bundle exec rspec spec/*.rb` for a specific test. (i.e. `bundle exec rspec spec/main_spec.rb`)

## What's Next?

- A beefed up command line (help document section)
- A web scraper for website inputs
- Integrate CI/CD

## Bugs

- None that are known