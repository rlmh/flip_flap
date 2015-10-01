# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    # split the records by new line
    # this piece of code works too
    # can't decide which is better in performance
    # this is a bit messy
    tsv_lines = tsv.split(/[\n]/)
    # getting the keys/field names
    keys = tsv_lines[0].split("\t").map(&:chomp)
    tsv_lines.shift # remove the first line which contains the keys
    @data = Array.new
    tsv_lines.each do |line|
      v = line.split("\t") # get values separated by tabs
      record = {} # create hash to store key value pair or record
      keys.each_index { |index| record[keys[index]] = v[index].chomp }
      # push the hash to the global array that holds all records
      @data << record
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
