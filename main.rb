require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
file_name = gets.chomp
    
  puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
  imput_memo = STDIN.read
  memo = imput_memo.chomp
    
  CSV.open('#{file_name}','w') do |csv|
  csv << [memo]
end
   
elsif memo_type == 2
  puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
      
  puts"メモの内容を記入して下さい。Ctrl+Dで保存します。"
  imput_memo = STDIN.read
  memo = imput_memo.chomp
    
  CSV.open("#{file_name}.csv", "a") do |csv|
  csv << [memo]
end  
      
else
  puts "1か2の数字を入力してください"
end