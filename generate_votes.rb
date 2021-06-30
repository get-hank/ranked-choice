#!/usr/bin/env ruby

require 'csv'
require 'securerandom'

NUM_BALLOTS = 10000
DUPE_FREQUENCY = 200
NUM_CHOICES = 5
CANDIDATES = [
  'Three Body Problem',
  'Roadside Picnic',
  'The Left Hand of Darkness',
  'Dune',
  'Neuromancer',
  'Snow Crash',
  'Do Androids Dream of Electric Sheep?',
  'Solaris',
  'The Hitchhiker\'s Guide to the Galaxy'
]
BALLOT_FILE = './votes.csv'

def cast_ballot(voter_id, csv, prng)
  num_choices = prng.rand(1..NUM_CHOICES)
  choices = CANDIDATES.shuffle[0..num_choices]
  csv << ([voter_id, DateTime.now.iso8601] + choices)
end

ballots_cast = 0
prng = Random.new

puts "Casting #{NUM_BALLOTS} ballots"

CSV.open(BALLOT_FILE, 'w') do |csv|
  csv << ['voter_id', 'voted_at'] + (0...NUM_CHOICES).map { |i| "choice #{i + 1}" }

  while ballots_cast < NUM_BALLOTS
    voter_id = SecureRandom.uuid

    cast_ballot(voter_id, csv, prng)
    if prng.rand(DUPE_FREQUENCY) == 0
      sleep 1 # ensure distinct timestamps
      cast_ballot(voter_id, csv, prng)
    end

    ballots_cast += 1

    if ballots_cast % 100 == 0
      puts "Cast #{ballots_cast} out of #{NUM_BALLOTS} so far"
    end
  end
end

puts "Done."
