SolrProbeURL = 'http://localhost:8983/solr/admin'

AfterConfiguration do
  system('bundle exec sunspot-solr start')

  wait_for('Solr startup') do
    begin
      resp = Net::HTTP.get_response(URI.parse(SolrProbeURL))

      ['2', '3'].include?(resp.code[0..0])
    rescue EOFError, Errno::ECONNREFUSED, Errno::ECONNRESET
      false
    end
  end
end

Before do
  Sunspot.remove_all!
end

Before do
  @objects = {}
end

at_exit do
  pid = File.read(File.expand_path('../../../sunspot-solr.pid', __FILE__)).to_i

  system('bundle exec sunspot-solr stop')

  wait_for('Solr shutdown') do
    begin
      Process.kill(0, pid)
    rescue Errno::ESRCH
      true
    rescue Errno::EPERM
      false
    end
  end
end

def wait_for(task)
  puts "Waiting for #{task} to complete"

  begin
    Timeout.timeout(30) do
      loop do
        if yield
          break
        else
          sleep 1
        end
      end
    end
  rescue Timeout::Error
    raise "Timeout occurred while waiting for #{task} to complete"
  end

  puts "#{task} completed"
end
