#! /usr/bin/env ruby

require 'rubygems'
require 'octokit'

class SendPullRequest
  def initialize
    @repo = ARGV[0]
  end

  def send
    client = Octokit::Client.new(:access_token => ENV["GH_TOKEN"])
    client.create_pull_request(
      "algolia/#{@repo}",
      "master",
      "algoliareadmebot:master",
      "Update readme",
      "Update read me"
    )
  end
end

mail = SendPullRequest.new
mail.send

