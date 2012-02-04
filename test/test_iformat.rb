require 'helper'

describe IFormat do

  after do
    IFormat.reset
  end

  describe '.wsdl' do
    it 'returns the default wsdl' do
      IFormat.wsdl.must_equal 'http://wsdl.iformat.pl/api.xml'
    end
  end

  describe '.wsdl=' do
    it 'sets custom wsdl' do
      IFormat.wsdl = 'http://example.com/wsdl.xml'
      IFormat.wsdl.must_equal 'http://example.com/wsdl.xml'
    end
  end

  describe '.username' do
    it 'returns the default username' do
      IFormat.username.must_equal nil
    end
  end

  describe '.username=' do
    it 'sets the username' do
      IFormat.username = 'iFormat Username'
      IFormat.username.must_equal 'iFormat Username'
    end
  end

  describe '.password' do
    it 'returns the default password' do
      IFormat.password.must_equal nil
    end
  end

  describe '.password=' do
    it 'sets the password' do
      IFormat.password = 'iFormat Password'
      IFormat.password.must_equal 'iFormat Password'
    end
  end

end
