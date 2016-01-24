require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  handler do |job, time|
    puts "Running #{job} at #{time}"
  end

  every(1.day, 'update.kanji') { Delayed::Job.enqueue UpdateKanjiJob.new }
  every(1.day, 'update.sources') { Delayed::Job.enqueue UpdateSourcesJob.new }

end
