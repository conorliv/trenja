class UpdateSourcesJob
  def perform
    sources = client.friends(random_source.name)
    KanjiSourceImporter.import(sources)
  end

  private

  def random_source
    Source.find_by_id(rand(0..Source.count))
  end

  def client
    @client ||= TwitterApi.client
  end
end
