require "rubygems"
require "json"
require "net/https"

repos = [
  "candycane",
  "cc_nyancat",
  "cc_epicsax",
  "cc_like_it"
]

repos.each do |repo|
    url = URI.parse("https://api.github.com/repos/yandod/#{repo}/downloads")
    request = Net::HTTP::Get.new("#{url.path}?#{url.query}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    response = http.start {|http| http.request(request) }
    json = JSON.parse(response.body)
    json.each do |node|
      puts "#{node['name']}\t#{node['download_count']}"
    end
end
