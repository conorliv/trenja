require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  handler do |job, time|
    puts "Running #{job} at #{time}"
  end

  every(2.hours, 'update.kanji') { Delayed::Job.enqueue KanjiUpdateJob.new }
  every(.hours, 'update.sources') { Delayed::Job.enqueue SourcesUpdateJob.new }
end

