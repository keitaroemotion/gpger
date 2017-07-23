require "minitest/autorun"
require "gpgme"
require "colorize"
require "./gpger.rb"
require "./test/test_helper.rb"

class GpgerTest < MiniTest::Test
  describe "gpg setting" do
    it "gpg correct setting validation" do
      assert Gpger.has_engine?("/usr/local/bin/gpg")
      assert Gpger.has_email_address?("tobasojyo@gmail.com")  
    end
  end

  describe "en/decryption" do
    it "" do
      crypto = GPGME::Crypto.new
      crypto.encrypt "Daisuki Myoin!", :recipients => "tobasojyo@gmail.com"
    end
  end
end
