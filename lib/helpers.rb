module Helpers
	module ModelHelpers
      def posted_at
		"#{created_at.strftime("%B %e %Y, %l:%M%p")}"
	  end
	end
end