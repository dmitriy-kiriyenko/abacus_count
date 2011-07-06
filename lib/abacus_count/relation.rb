require 'abacus_count/calculations'

module AbacusCount
  module Relation
    def abacus
      extending(AbacusCount::Calculations)
    end
  end
end

ActiveRecord::Relation.send(:include, AbacusCount::Relation)
