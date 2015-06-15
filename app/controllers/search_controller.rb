class SearchController < ApplicationController
    def artist
        @url1 = "http://ws.audioscrobbler.com/2.0/?method=artist.search&artist="
        
        @urlsimi = "http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist="
        @artistname = params[:artist] 
        @url2 = "&api_key=161861de736d0ac2273fda645becb5a8&format=json"
        @url = @url1 + @artistname + @url2
        @url = URI::encode(@url)
        @url_similar = @urlsimi + @artistname + @url2
        @url_similar = URI::encode(@url_similar)
        require 'open-uri'
        @artist_det = JSON.parse(open(@url).read)
        @similar_artist_det = JSON.parse(open(@url_similar).read)
    end
end
