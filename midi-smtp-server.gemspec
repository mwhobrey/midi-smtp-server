Gem::Specification.new do |s|
  s.name        = 'midi-smtp-server'
  s.version     = '2.1.2'
  s.date        = '2015-09-12'
  s.summary     = 'MidiSmtpServer Class'
  s.description = 'A small and highly customizable ruby SMTP-Server.'
  s.authors     = ['Tom Freudenberg', 'Michael Whobrey']
  s.email       = 'develop.rb.midi-smtp-server@4commerce.net'
  s.files       = [
    'README.md',
    'MIT-LICENSE.txt',
    'lib/midi-smtp-server.rb'
  ]
  s.homepage    = 'https://github.com/mwhobrey/midi-smtp-server/'
  s.license     = 'MIT'
  s.add_runtime_dependency 'ruby-tls'
end
