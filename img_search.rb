require 'net/http'

uri = URI('https://api.cognitive.microsoft.com/bing/v5.0/images/search')
uri.query = URI.encode_www_form({
    # Request parameters
    'q' => 'cats'
})

request = Net::HTTP::Post.new(uri.request_uri)
# Request headers
request['Content-Type'] = 'multipart/form-data'
# Request headers
request['Ocp-Apim-Subscription-Key'] = '{subscription key}'
# Request body
request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

puts response.body