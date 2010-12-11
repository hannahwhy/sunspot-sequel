# 
# Extensions to Ruby's core classes to make testing easier.
#
require 'extlib/inflection'

class String
  def constantize
    Extlib::Inflection.constantize(Extlib::Inflection.classify(self))
  end
end
