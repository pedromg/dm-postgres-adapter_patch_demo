module DataMapper
  class Query

    module Conditions

      # Tests whether the value in the record is like the expected set
      # for the Comparison. Equivalent to a ILIKE clause in an SQL database.
      #
      # TODO: move this to dm-more with DataObjectsAdapter plugins
      class IlikeComparison < AbstractComparison
        slug :ilike

        private

        # Overloads the +expected+ method in AbstractComparison
        #
        # Return a regular expression suitable for matching against the
        # records value.
        #
        # @return [Regexp]
        #
        # @see AbtractComparison#expected
        #
        # @api semipublic
        def expected
          Regexp.new('\A' << super.gsub('%', '.*').tr('_', '.') << '\z')
        end

        # @return [String]
        #
        # @see AbstractComparison#to_s
        #
        # @api private
        def comparator_string
          'ILIKE'
        end
      end # class IlikeComparison

    end # module Conditions
  end # class Query
end # module DataMapper
