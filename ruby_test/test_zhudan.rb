class Test_info
def test_info
################################################################################
#���P�D�w��t�@�C���������Hash�ɓǍ���

#hash�̕ϗʂ��`
file_data = {}

File.open("���.info"){|f|
  info_index = 0
  #hash��key
  hashinfo_key = []
  #hash��value
  hashinfo_value = [[],[],[],[],[]]
  f.each_line do |line|
      
      #�s�̓��e�̕���
      line_data= line.split(',')
      #info�t�@�C����index
      info_index = info_index + 1
      #hash��key��value�̎擾
      case info_index
      when 1
      	then  #hash��key�̎擾
              hashinfo_key = line_data
      else
             #hash��value�̎擾
             
             #���R�DArray�Ƀ��R�[�h���������ǉ�����
             #�������@�Fpush
             #�����ė�Fhashinfo_value[0].push(line_data[0])
             file_data[hashinfo_key[0]] = hashinfo_value[0].push(line_data[0])
             file_data[hashinfo_key[1]] = hashinfo_value[1].push(line_data[1])
             file_data[hashinfo_key[2]] = hashinfo_value[2].push(line_data[2])
             file_data[hashinfo_key[3]] = hashinfo_value[3].push(line_data[3])
             file_data[hashinfo_key[4]] = hashinfo_value[4].push(line_data[4])
      end
  end
  #���S�DArray�̏d�����R�[�h������
  puts "#######���S�̌���###################################################"
  p hashinfo_value[1].uniq
  #���T.Array��"name"�̍~���Ń\�[�g����
  puts "#######���T�̌���###################################################"
  p hashinfo_value[1].sort {|x,y| y <=> x }
  #���U�D"age"�̍��v���擾����(each���\�b�h���g�p)
  puts "#######���U�̌���###################################################"
  sum = 0
  hashinfo_value[3].each do |item|
     sum = sum + item.to_i
  end
  p sum
  #���V�D"score"�̍��v���擾����(inject���\�b�h���g�p)
  puts "#######���V�̌���###################################################"
  p hashinfo_value[4].inject(0){|sum,item| sum+item.to_f}
  #���W�DArray����sex��male�̃��R�[�h������(collect)
  puts "#######���W�̌���###################################################"
  p hashinfo_value[2].select{|i| i ==  "female"}
}
puts "#######���P�̌���#####################################################"
p file_data
################################################################################
end
end

test_info = Test_info.new
test_info.test_info