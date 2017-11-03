require 'ruby-tls'

# class copied from https://github.com/cotag/ruby-tls
class MidiSmtpTls
  def initialize(cert, key)
    is_server = true
    callback_obj = self
    options = {
      verify_peer: true,
      private_key: key,
      cert_chain: cert,
      ciphers: 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-RC4-SHA:ECDHE-RSA-AES128-SHA:AES128-GCM-SHA256:RC4:HIGH:!MD5:!aNULL:!EDH:!CAMELLIA:@STRENGTH' # (default)
      # protocols: ["h2", "http/1.1"], # Can be used where OpenSSL >= 1.0.2 (Application Level Protocol negotiation)
      # fallback: "http/1.1", # Optional fallback to a default protocol when either client or server doesn't support ALPN
      # client_ca: '/file/path.pem'
    }
    @ssl_layer = RubyTls::SSL::Box.new(is_server, callback_obj, options)
  end

  def close_cb
    puts 'The transport layer should be shutdown'
  end

  def dispatch_cb(_data)
    puts 'Clear text data that has been decrypted'
  end

  def transmit_cb(_data)
    puts 'Encrypted data for transmission to remote'
    # @tcp.send data
  end

  def handshake_cb(_protocol)
    puts 'initial handshake has completed'
  end

  def verify_cb(cert)
    # Return true or false
    # is_cert_valid? cert
    true
  end

  def start_tls
    # Start SSL negotiation when you are ready
    @ssl_layer.start
  end

  def send(data)
    @ssl_layer.encrypt(data)
  end

  def decrypt(data)
    ret = @ssl_layer.decrypt(data)
    dispatch_cb(data)
    ret
  end
end
