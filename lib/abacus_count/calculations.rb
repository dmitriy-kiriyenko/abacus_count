module AbacusCount
  module Calculations
    def execute_simple_calculation(operation, column_name, distinct)
      execute_subquery_calculation(operation, column_name, distinct)
    end

    def execute_grouped_calculation(operation, column_name, distinct)
      execute_subquery_calculation(operation, column_name, distinct)
    end

    def execute_subquery_calculation(operation, column_name, distinct)
      relation = reorder(nil)

      column_alias = Arel.sql("#{operation}_column")
      subquery_alias = Arel.sql("subquery_for_#{operation}")

      aliased_column = aggregate_column(column_name == :all ? 1 : column_name).as(column_alias)
      relation.select_values += [aliased_column]

      subquery = build_subquery(relation, subquery_alias)

      sm = Arel::SelectManager.new relation.engine
      select_value = operation_over_aggregate_column(column_alias, operation, distinct)
      query_builder = sm.project(select_value).from(subquery)

      type_cast_calculated_value(@klass.connection.select_value(query_builder.to_sql), column_for(column_name), operation)
    end

    def build_subquery(relation, aliaz)
      # Since arel 2.1.1 it will look like
      # relation.arel.as(subquery_alias)
      Arel::Nodes::As.new(Arel::Nodes::Grouping.new(relation.arel.ast), Arel::Nodes::SqlLiteral.new(aliaz))
    end

  end
end