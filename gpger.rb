class Gpger
  def self.has_email_address?(email_address)
    GPGME::Key.find(:secret, email_address)
      .map    { |info| info.uids                  }
      .flatten
      .select { |uid|  uid.email == email_address }
      .any?
  end

  def self.has_engine?(expection)
    GPGME::Engine.info.select { |info| info.file_name == expection }.any?
 end
end
