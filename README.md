# Ruby Log Parser
## Implementation

To execute the script, please clone the directory and cd into it. 

Ruby version used for this project is 3.1.1. As I had rspec already installed, there is no gemfile in this repo.

To install rspec

`gem install rspec`

To run the project

`ruby ./parser.rb webserver.log`

To run specs

`rspec`

As this taks was time bound, the idea was to implement the basic working structure and add tests for it.

This can be made better by having IPs as hash keys. Currently they are stored in an array which can be memory intensice.

Code can be refactored to have exception handling / validation once parser is initialised. File format and number of files etc can be validated there.



## Requirements

Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...
