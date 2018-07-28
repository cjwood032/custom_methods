tags_list = ["add", "delete", "inspect", "insert", "sort", "non-destructive", "destructive"]
tags_list.each do |name|
  p = Tag.new
  p.name = name
  p.save
end
methods_list = {
    "collect" => {
      :name => "collect",
      :language => "ruby",
      :description => "Returns a new array with the results of running block once for every element in enum",
      :mephod_data => ".collect",
      :tag => "inspect"
    },
   	"count" => {
      :name => "count",
      :language => "ruby",
      :description => "Returns the number of items in enum through enumeration",
      :mephod_data => ".count",
      :tag => "inspect, non-destructive"
    },
  }

methods_list.each do |name, method_hash|
  p = Mephod.new
  p.name = name
  method_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end
