module DataMapper
  module Adapters

    class PostgresAdapter

      module SQL #:nodoc:
        private

        def comparison_operator(comparison)
          subject = comparison.subject
          value   = comparison.value

          # Extending method to include postgres ILIKE comparison
          case comparison.slug
            when :ilike  then ilike_operator(value)
            else super # back to the original method in class DataObjectsAdapter
          end
        end

        # @api private
        def ilike_operator(operand)
          'ILIKE'
        end

      end
    end
  end
end
