require 'helper'

describe IFormat::Client do

  describe 'with module configuration' do

    before do
      IFormat.configure do |config|
        config.wsdl     = 'http://example.com/module.xml'
        config.username = 'Module Username'
        config.password = 'Module Password'
      end
    end

    after do
      IFormat::Configuration.instance.send(:reset!)
    end

    it 'inherits module configuration' do
      api = IFormat::Client.new

      api.wsdl.must_equal 'http://example.com/module.xml'
      api.username.must_equal 'Module Username'
      api.password.must_equal 'Module Password'
    end

    describe 'with class configuration' do

      describe 'during initialization' do
        it 'overrides module configuration' do
          api = IFormat::Client.new({:wsdl => 'http://example.com/class.xml', :username => 'Class Username'})

          api.wsdl.must_equal 'http://example.com/class.xml'
          api.username.must_equal 'Class Username'
          api.password.must_equal 'Module Password'
        end
      end

      describe 'after initilization' do
        it 'overrides module configuration after initialization' do
          api = IFormat::Client.new
          api.wsdl = 'http://example.com/class.xml'
          api.username = 'Class Username'

          api.wsdl.must_equal 'http://example.com/class.xml'
          api.username.must_equal 'Class Username'
          api.password.must_equal 'Module Password'
        end
      end

    end

  end

end