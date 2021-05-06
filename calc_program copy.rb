require "./input_string"
require "./formula"
require "./unit_converter"


# 入力された文字列をtextに格納
text = ARGV.first

# 文字列を要素に分解
input_string = InputString.new(text)


elements = input_string.text

# 単位変換(→最小単位)
unit_converter = UnitConverter.new(elements)
elements_unit_mg = unit_converter.convert_to_min

# 計算式を作成。計算
formula = Formula.new(elements_unit_mg)
result_for_mg = formula.calculate

# 計算結果を正しい単位に変換
answer = unit_converter.convert_to_correct(result_for_mg)

puts answer





