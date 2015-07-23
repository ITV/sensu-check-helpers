module SensuCheckHelpers
  module AWS
    def running_instances
      client = Aws::EC2::Client.new(region: 'eu-west-1')

      # Aws::EC2::Resource creates a default client but it's cleaner this way
      ec2    = Aws::EC2::Resource.new(client: client)

      ec2.instances.map do |instance|
        next unless instance.state.name == 'running'
        {
          id: instance.id.gsub('-', ''),
          ip: instance.private_ip_address
        }
      end.compact
    end
  end
end
