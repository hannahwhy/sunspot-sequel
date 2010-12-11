AfterConfiguration do
  system('bundle exec sunspot-solr start')

  Timeout.timeout(10) do
    loop do
      begin
        resp = Net::HTTP.get_response(URI.parse('http://localhost:8983/solr/admin'))

        break if ['2', '3'].include?(resp.code[0..0])
      rescue Errno::ECONNREFUSED
      end

      sleep 1
    end
  end
end

at_exit do
  system('bundle exec sunspot-solr stop')
end
