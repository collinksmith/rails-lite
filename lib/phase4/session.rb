require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      req.cookies.each do |cookie|
        if cookie.name == '_rails_lite_app'
          value = JSON.parse(cookie.value)
          @cookie = value
          return
        end
      end

      @cookie = {}
    end

    def [](key)
      @cookie[key]
    end

    def []=(key, val)
      @cookie[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      browser_cookie = WEBrick::Cookie.new("_rails_lite_app", @cookie.to_json)
      res.cookies << browser_cookie
    end
  end
end
