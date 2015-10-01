# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    # split the records by new line

    temp = tsv.split(/[\n]/)
    # get the field names (keys) which are in the first record
    keys = temp[0].split(/[\t]/)
    temp.shift
    #do a mapping by transposing
    @data = Array.new
    temp.map do |rec|
      @data << Hash[[ keys,rec.split("\t") ].transpose]
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @data[0].map { |k, v| k }.join("\t").concat( "\n" +
      @data.map {|ak, bv| ak.map {|k, v| "#{v}"}.join("\t")}.join("\n")
    ) + "\n"
  end
end
