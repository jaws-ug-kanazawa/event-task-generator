# coding: utf-8
require 'octokit'
require 'dotenv'
require 'yaml'
require 'erb'

Dotenv.load

if ARGV.empty?
  puts 'ruby main.rb <YAML-FILE> <EventTitle>'
  exit
end

erb_str = File.read(ARGV[0])
yaml = ERB.new(erb_str).result_with_hash(title: ARGV[1])

yml = YAML.safe_load(yaml)

client = Octokit::Client.new(
  login:    ENV['GITHUB_USER'],
  password: ENV['GITHUB_TOKEN']
)
repository = yml['repository']
eventname  = yml['event']
yml['tasks'].each do |t|
  # p "#{repository} #{eventname} - #{t['title']}"
  p client.create_issue(repository, "#{eventname} - #{t['title']}", t['body'])
end
