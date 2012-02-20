require 'helper'

describe IFormat do

  after do
    IFormat::Configuration.instance.send(:reset!)
  end
  
  describe '::respond_to?' do
    it 'takes an optional argument' do
      IFormat.respond_to?(:new, true).must_equal true
    end
  end

  describe '::new' do
    it 'returns an IFormat::Client' do
      IFormat.new.must_be_instance_of IFormat::Client
    end
  end

  describe '::configure' do

    describe 'with configuration block' do

      it 'configures default Client options' do
        IFormat.configure do |config|
          config.wsdl     = 'http://example.com/wsdl.xml'
          config.username = 'john'
          config.password = 'doe'
        end

        IFormat.config.wsdl.must_equal     'http://example.com/wsdl.xml'
        IFormat.config.username.must_equal 'john'
        IFormat.config.password.must_equal 'doe'
      end

      it 'allows nil option values' do
        IFormat.configure do |config|
          config.wsdl     = nil
          config.username = nil
          config.password = nil
        end

        IFormat.config.wsdl.must_equal     nil
        IFormat.config.username.must_equal nil
        IFormat.config.password.must_equal nil
      end

    end

  end

end
