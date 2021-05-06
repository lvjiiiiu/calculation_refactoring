require "./program_config"
# InputStringの責任：
# 入力された文字列の加工、異常系の判定

class InputString
  attr_reader :text
  def initialize(text)
    @text = text.chomp.split(" ")
    # initializeの中でchomp, splitしていいんだ〜
    config_abnormal
  end

end