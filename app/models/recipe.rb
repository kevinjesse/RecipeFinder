# Written by Kevin Jesse for Coursera.org

class Recipe
  include HTTParty

  key_value = ENV["FOOD2FORK_KEY"]
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  default_options.update(verify: false) # Turn off SSL verification
  base_uri "http://#{hostport}/api/"
  default_params key: key_value
  format :json

  def self.for term
    p get("/search", query: { q: term})["recipes"]
  end
end