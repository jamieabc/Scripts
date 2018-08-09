files = `ls`.split("\n")

# generate proper epub file
files.each do |f|
  name, suffix = f.split('.')
  next if suffix != 'epub'
  puts "rename #{f}..."
  `mv "#{f}" "#{name}"`

  puts "generate zip flie...#{name}"
  `zip -vur "#{name}" mimetype "#{name}"/*`

  puts "moving '#{name}.zip' into '#{name}.epub'"
  `mv "#{name}.zip" "#{name}.epub"`
end
