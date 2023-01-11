# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#module Sb; end # namespaceとしてSBを使うため(SBはSandboxの略)
::SB = ::Sb
