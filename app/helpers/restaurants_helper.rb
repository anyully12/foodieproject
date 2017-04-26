module RestaurantsHelper
require "json"
  require "http"
  require "optparse"
  def bearer_token
    url = "https://api.yelp.com/oauth2/token"
    params = {
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["CLIENT_SECRET"],
      grant_type: "client_credentials"
    }
    response = HTTP.post(url, params: params)
    parsed = response.parse
    "#{parsed['token_type']} #{parsed['access_token']}"
  end
  def method_to_call_api(term, location)
    url = "https://api.yelp.com/v3/businesses/search"
    params = {
      term: term,
      location: location,
      limit: 10
    }
    response = HTTP.auth(bearer_token).get(url, params: params)
    response.parse
  end
end