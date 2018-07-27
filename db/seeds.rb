tags_list = ["add", "delete", "inspect", "insert", "sort", "non-destructive", "destructive"]

tags_list.each do |name|
  p = Tags.new
  p.name = name
  p.save
end
