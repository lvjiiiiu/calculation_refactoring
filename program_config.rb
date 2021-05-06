require "./unit_converter"

module ProgramConfig

# 異常系の設定
  def config_abnormal
    mass_exp = /[0-9]+[a-z]+/
    formula = @text.join(" ")

    # 引数の先頭が質量ではなかった場合
    unless mass_exp.match?(@text.first)
      raise ArgumentError.new("error: first argument must be weight-value(ex: 1kg)")
    end

    if /[*\/] [0-9]+[a-z]+/.match?(formula)
      raise ArgumentError.new("error: multiplier & divisor must be a number at * , \/")
    end

    @text.each do |token|
      unit = token.slice(/[a-z]+/)
      # もし、単位がなければ、続く処理をスキップ
      next if unit.nill?
      # 単位がついているとき、それがUNITSのkeyの中に含まれているか判定
      unless UnitConverter::UNITS.keys.any?(unit)
        raise ArgumentError.new("error: the unit must be one of #{UnitConverter::UNITS.keys}")
      end
    end
  end
end

