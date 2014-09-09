require 'sparql/client'

$client = SPARQL::Client.new("http://dbpedia.org/sparql")

QUERY_TEMPLATE = <<-eos
SELECT ?s WHERE {
  {
    ?s dbpprop:name "%NAME%"@en ;
       a foaf:Person .
  }
}
eos

def find(name)
  q = QUERY_TEMPLATE.gsub('%NAME%', name)
  result = $client.query(q)
end

def match(num = nil)
  output = {}
  people = EacPerson.includes(:names)
  unless num.nil?
    people = EacPerson.limit(num)
  end
  people.each do |person|
    results = []
    person.names.each do |name_record|
      name = name_record.text
      #puts "---------> #{name}"
      matching = find(name)
      results += matching.map(&:s).map(&:to_s)
    end
    if results.length > 0
      output[person.archival_record_identifier] = results
    end
  end
  puts "#{output.length} found"
  output
end