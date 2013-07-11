# encoding: utf-8

Adhearsion.config do |config|

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end

  config.development do |dev|
    dev.platform.logging.level = :debug
  end

  ##
  # Use with Rayo (eg Voxeo PRISM)
  #
  # config.punchblock.username = "" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "" # Your XMPP password

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = "manager" # Your AMI username
  config.punchblock.password = "password" # Your AMI password
  config.punchblock.host = "10.203.175.11" # Your AMI host

  config.adhearsion_activerecord.username = "root"
  config.adhearsion_activerecord.password = "dbpamela"
  config.adhearsion_activerecord.database = "ringplus_api"
  config.adhearsion_activerecord.adapter  = "mysql" # i.e. mysql, sqlite3
  config.adhearsion_activerecord.host     = "localhost"    # i.e. localhost
  config.adhearsion_activerecord.socket   = "/tmp/mysql.sock"
  config.adhearsion_activerecord.model_paths = ["/Users/luca/projects/mcituning/lib/models/member.rb",
                                                "/Users/luca/projects/mcituning/lib/models/transaction.rb"]

  ##
  # Use with FreeSWITCH
  #
  # config.punchblock.platform = :freeswitch # Use FreeSWITCH
  # config.punchblock.password = "" # Your Inbound EventSocket password
  # config.punchblock.host = "127.0.0.1" # Your IES host
end

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  # punchblock do |event|
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  # ami :name => 'PeerStatus' do |event|
  #   ...
  # end
  #
end

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  route 'default', MciTuningController
end
