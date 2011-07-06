require "abacus_count/version"

require "active_record"
require "active_record/base" # TODO: that's because ActiveRecord::Relation does not load delegation core_ext from active_support.
                             # Perhaps, Rails are waiting for a patch

require "abacus_count/relation"

module AbacusCount
  # Your code goes here...
end
