require "./unit_converter"
# InputStringの責任：
# 入力された文字列の加工、異常系の判定

class TokenPaser
  attr_reader :tokens
  def initialize(text)
    @tokens = text.chomp.split(" ")
    # initializeの中でchomp, splitしていいんだ〜
    validate!
  end

  private

  def validate!
    mass_exp = /[0-9]+[a-z]+/
    formula = @text.join(" ")

    # 引数の先頭が質量ではなかった場合
    unless mass_exp.match?(@tokens.first)
      raise ArgumentError, "error: first argument must be weight-value(ex: 1kg)"
    end

    if /[*\/] [0-9]+[a-z]+/.match?(formula)
      raise ArgumentError, "error: multiplier & divisor must be a number at * , \/"
    end

    @token.each do |token|
      unit = token.slice(/[a-z]+/)
      # もし、単位がなければ、続く処理をスキップ
      next if unit.nill?
      # 単位がついているとき、それがUNITSのkeyの中に含まれているか判定
      unless UnitConverter::UNITS.keys.any?(unit)
        raise ArgumentError, "error: the unit must be one of #{UnitConverter::UNITS.keys}"
      end
    end
  end

end