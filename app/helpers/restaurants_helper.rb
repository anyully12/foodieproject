module RestaurantsHelper
require "json"
  require "http"
  require "optparse"
  def bearer_token
    url = "https://api.yelp.com/oauth2/token"
    params = {
      client_id: "R9MRFF-cuGcYhTlDoEhLFw",
      client_secret: "NIaJvB6akvRZUsFxoOdcr7dJyvVwGdeZcAybqXqpP5RPRbHqdNcHPB7cMP1SN1Wv",
      grant_type: "client_credentials"
    }
    response = HTTP.post(url, params: params)
    parsed = response.parse
    "#{parsed['token_type']} #{parsed['access_token']}"
  end
  def search_restaurants(term, location)
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