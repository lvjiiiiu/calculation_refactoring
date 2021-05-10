require "./input_string"
require "./unit_converter"


# 入力された文字列をtextに格納
text = ARGV.first

# 文字列を要素に分解
input_string = InputString.new(text)


tokens = input_string.tokens

# 単位変換(→最小単位)
unit_converter = UnitConverter.new(tokens)

# 計算結果を正しい単位に変換
answer = unit_converter.calculate

puts answer





