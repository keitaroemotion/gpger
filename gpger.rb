class Gpger
  def initialize(recipients)
    @crypto     = GPGME::Crypto.new
    @recipients = recipients
  end

  def encrypt(text)
    @crypto.encrypt text, :recipients => @recipients
  end

  def decrypt(text)
    @crypto.decrypt(
      text,
      :recipients => @recipients,
      :password   => "moomin"
    ).to_s
  end

  def has_email_address?(email_address)
    GPGME::Key.find(:secret, email_address)
      .map    { |info| info.uids                  }
      .flatten
      .select { |uid|  uid.email == email_address }
      .any?
  end

  def has_engine?(expection)
    GPGME::Engine.info.select { |info| info.file_name == expection }.any?
 end
end
