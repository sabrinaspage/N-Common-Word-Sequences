# Challenge by New Relic

Table of Contents
- [Challenge by New Relic](#challenge-by-new-relic)
  - [How to Run Program](#how-to-run-program)
  - [How to Run Tests](#how-to-run-tests)
  - [What's Next?](#whats-next)
  - [Bugs](#bugs)

## How to Run Program

Run `ruby lib/run.rb` and add the relative path to the file (i.e. `texts/moby-dick.txt`) as input.

## How to Run Tests

Run `bundle exec rspec` for all tests.

Run `bundle exec rspec spec/*.rb` for a specific test. (i.e. `bundle exec rspec spec/main_spec.rb`)

## What's Next?

- A beefed up command line (help document section)
- A web scraper for website inputs
- Dockerize with a web framework
- Integrate CI/CD

## Bugs

- Not entirely sure why my test output is in ascending order than descending order; but, my files work with the existing articles in `texts`.