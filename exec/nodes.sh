#!/usr/bin/env ruby
require "json"

hosts = {
  production: "nodes.live.bitmark.com",
  staging: "nodes.test.bitmark.com"
}

cmd = "host -t txt"

def parse_result(line)
  ip4, ip6, public_key = line.match(/a=(.*);\[(.*)\].*p=(.*)"/).captures
  puts "#{ip4}\t\t#{ip6}\t\t#{public_key}\n"
end

hosts.each do |category, host|
  puts category.to_s
  `#{cmd} #{host}`.split("\n").each do |line|
    next if line.start_with?(';')

    parse_result line
  end
end
