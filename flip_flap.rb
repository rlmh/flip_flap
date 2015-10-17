require_relative 'tsv_buddy'
require_relative 'yaml_buddy'
require 'yaml'

# inject tsv code using include
# inject yaml code using include
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy
  include YamlBuddy
end
