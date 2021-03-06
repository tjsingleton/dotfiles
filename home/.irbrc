require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE


require 'pp' #stdlib
#
# # Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

def require_or_msg(lib, msg = nil)
  require lib
  yield if block_given?
rescue LoadError
  puts msg if msg
end

require_or_msg("rubygems") do
  require_or_msg("wirble") do
    Wirble.init
    Wirble.colorize
  end
  require_or_msg("hirb") { Hirb::View.enable }
  require_or_msg 'interactive_editor'
  require_or_msg('ap')
  require_or_msg('drx')
  require_or_msg("bond") { Bond.start }
end

# detects a rails console, cares about version
def rails?(*args)
    version=args.first
    v2 = ($0 == 'irb' && ENV['RAILS_ENV'])
    v3 = ($0 == 'script/rails' && Rails.env)
    version == 2 ? v2 : version == 3 ? v3 : v2 || v3
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if rails?
