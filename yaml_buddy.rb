# Module that can be included (mixin) to create and parse YAML data
module YamlBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_yaml: converts a String with YAML data into @data
  # parameter: yml - a String in YAML format
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  # to_yaml: converts @data into yaml string
  # returns: String in YAML format
  def to_yaml
    @data.to_yaml
  end
end
