return unless Meteor.isServer

Meteor.methods
	'shortenUrl': (longUrl) ->
		check longUrl, String

		api_key = Meteor.settings.google_url_shortener_api_key ? GOOGLE_URL_SHORTENER_API_KEY
		unless api_key?
			throw new Meteor.Error 403, 'GOOGLE_URL_SHORTENER_API_KEY not found'

		res = HTTP.call 'POST', "https://www.googleapis.com/urlshortener/v1/url?key=#{api_key}", 
			content: 'application/json'
			data: 'longUrl': longUrl
			timeout: 3000

		if res.statusCode is 200
			return res.data
		else
			throw new Meteor.Error res.statusCode, res.content.error
