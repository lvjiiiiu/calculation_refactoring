require "./token_parser"
# UnitConverterの責任：
# 単位を変換する

class TokeCalculater
  UNITS = { "mg" => 1, "g" => 1000, "kg" => 1000000 }.freeze

  def initialize(text)
    @tokens = TokenPaser.new(text).tokens
    @units = filter_units
    validate_units!
  end

  def calculate
    tokens = convert_to_min
    sum = eval(tokens.join)
    convert_to_correct(sum)
  end 

  private

  # 質量を最小(UNITSで1と設定したもの)に変換
  def convert_to_min
    @tokens.map do |token|
      if token =~ /[0-9]+[a-z]+/
        unit = token.slice(/[a-z]+/)
        num = token.slice(/[0-9]+/).to_i
        ratio = UNITS[unit]
        num * ratio
      else
        token
      end
    end
  end


  def convert_to_correct(sum)
    min_unit = @units.sort_by { |u| UNIT[u] }.first
    ratio = UNITS[min_unit]
    "#{( sum / ratio ).to_s}#{min_unit}"
  end 



  def filter_units
    @tokens.
    select { |token| /[0-9]+[a-z]+/.match?(token) }.
    map { |token| token.slice(/[a-z]+/) }
  end

  def validate_units!
    @units.each do |unit|
      unless UNITS.keys.any?(unit)
        raise ArgumentError, "error: the unit must be one of #{UNITS.keys}"

end
