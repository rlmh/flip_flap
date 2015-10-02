require_relative 'tsv_buddy'
require 'yaml'

# convert to YAML
# inject tsv code using include
class FlipFlap
  # Do NOT create an initialize method
  include TsvBuddy

  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data.to_yaml
  end
end
