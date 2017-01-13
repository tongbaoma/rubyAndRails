class Test_info
def test_info
################################################################################
#問題１．指定ファイルから情報をHashに読込む

#hashの変量を定義
file_data = {}

File.open("情報.info"){|f|
  info_index = 0
  #hashのkey
  hashinfo_key = []
  #hashのvalue
  hashinfo_value = [[],[],[],[],[]]
  f.each_line do |line|
      
      #行の内容の分割
      line_data= line.split(',')
      #infoファイルのindex
      info_index = info_index + 1
      #hashのkeyとvalueの取得
      case info_index
      when 1
      	then  #hashのkeyの取得
              hashinfo_key = line_data
      else
             #hashのvalueの取得
             
             #問題３．Arrayにレコードをいくつか追加する
             #解決方法：push
             #解決案例：hashinfo_value[0].push(line_data[0])
             file_data[hashinfo_key[0]] = hashinfo_value[0].push(line_data[0])
             file_data[hashinfo_key[1]] = hashinfo_value[1].push(line_data[1])
             file_data[hashinfo_key[2]] = hashinfo_value[2].push(line_data[2])
             file_data[hashinfo_key[3]] = hashinfo_value[3].push(line_data[3])
             file_data[hashinfo_key[4]] = hashinfo_value[4].push(line_data[4])
      end
  end
  #問題４．Arrayの重複レコードを除く
  puts "#######問題４の結果###################################################"
  p hashinfo_value[1].uniq
  #問題５.Arrayを"name"の降順でソートする
  puts "#######問題５の結果###################################################"
  p hashinfo_value[1].sort {|x,y| y <=> x }
  #問題６．"age"の合計を取得する(eachメソッドを使用)
  puts "#######問題６の結果###################################################"
  sum = 0
  hashinfo_value[3].each do |item|
     sum = sum + item.to_i
  end
  p sum
  #問題７．"score"の合計を取得する(injectメソッドを使用)
  puts "#######問題７の結果###################################################"
  p hashinfo_value[4].inject(0){|sum,item| sum+item.to_f}
  #問題８．Arrayからsexがmaleのレコードを除く(collect)
  puts "#######問題８の結果###################################################"
  p hashinfo_value[2].select{|i| i ==  "female"}
}
puts "#######問題１の結果#####################################################"
p file_data
################################################################################
end
end

test_info = Test_info.new
test_info.test_info