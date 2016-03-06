class SourcesUpdateJob
  def perform
    random_source = Source.random_source.name
    puts "SOURCES UPDATE JOB: Using #{random_source} as a random source."
    sources = TwitterApi.client.friends(random_source).take(20)
    puts "SOURCES UPDATE JOB: Retrieved #{sources.count} sources from #{random_source}."
    SourceImportService.import(sources)
  end
end
