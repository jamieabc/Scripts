#!/usr/bin/env ruby

def generate_voice(dir_name, file_name, no_slit = false)
  Dir.chdir dir_name
  if no_slit
    `say -o '#{file_name.split('.').first}.m4a' -f '../#{file_name}'`
  else
    `ls`.split("\n").each do |f|
      mp3_file = f.split(".").first
      `say -o '#{mp3_file}.m4a' -f #{f}`
    end
  end
end

args = ARGF.argv

# check input parameters
if args.empty?
  puts 'Usage:'
  puts "\t [file_name] ['paragraph_name1', 'paragraph_name2', ...]"
  exit 0
end

file_name = args.first

# check file existence
unless file_name.end_with?('txt') ||
       File.exist?(file_name) ||
       File.exist?("./#{file_name}")

  puts "#{file_name} not match or not exist"
  exit 0
end

dir_name = 'paragraphs'

# delete directory and create new one
`rm -rf #{dir_name}` if Dir.exist? dir_name
Dir.mkdir dir_name

unless args.size > 1
  puts 'No paragraphs input, set to whoe text content'
  generate_voice(dir_name, file_name, true)
  exit 0
end

# parse file
data = File.read(file_name)

paragraphs = ARGF.argv[1, ARGF.argv.size]

# '第一章　你必须学会读财报' '第二章　投资高手关心的表——资产负债表' '第三章　资本市场追捧的表——利润表' '第四章　事关存亡的表——现金流量表' '第五章　财报的综合阅读及分析' '第六章　所有者权益变动表和财报附注' '第七章　管理层的汇报' '第八章　欺诈与反欺诈'

# start after index list
start = data.index(paragraphs.last) + 1

paragraphs_index = paragraphs.map do |p|
  data[start, data.size].index(p) + start
end

paragraphs_index.each_with_index do |loc, idx|
  file_name = "./#{dir_name}/#{paragraphs[idx]}.txt"
  paragraph_end_index = idx < paragraphs_index.size - 1 ? paragraphs_index[idx + 1] : data.bytesize
  content = data[loc, paragraph_end_index]
  f = File.open(file_name, 'w')
  f.write content
  f.close
end

generate_voice(dir_name, file_name, false)