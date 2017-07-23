require "minitest/autorun"
require "gpgme"
require "colorize"
require "./gpger.rb"
require "./test/test_helper.rb"

class GpgerTest < MiniTest::Test
  describe "gpg setting" do
    def setup
      @crypt = Gpger.new
    end
    it "gpg correct setting validation" do
      assert @crypt.has_engine?("/usr/local/bin/gpg")
      assert @crypt.has_email_address?("tobasojyo@gmail.com")  
    end
  end

  describe "en/decryption" do
    def setup
      @crypt = Gpger.new
    end
    it "" do
      encrypted_data = @crypt.encrypt("Daisuki Myoin!", "tobasojyo@gmail.com")
      assert encrypted_data.to_s.any?
    end
  end
end
