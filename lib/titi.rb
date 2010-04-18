require 'restclient'
require 'json'
require 'wukong'
require 'erubis'

module Titi
  autoload :Provider,  'titi/provider'
  autoload :Adaptor,   'titi/adaptor'
  autoload :Fetcher,   'titi/fetcher'
  autoload :Serialize, 'titi/serialize'
end
