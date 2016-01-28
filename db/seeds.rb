Source.delete_all
Review.delete_all

Source.create!(name: 'makoJOSIAH', value_index: 5, source_type: 'twitter')

Kanji.create!([
  { kanji: '車', count: 10 },
  { kanji: '今', count: 5 },
  { kanji: '馬', count: 4 },
  { kanji: '日', count: 3 }
])

