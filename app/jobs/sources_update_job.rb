class SourcesUpdateJob
  def perform
    random_source = Source.random_source
    sources = TwitterApi.client.friends(random_source.name)
    SourceImportService.import(sources)
  end
end
