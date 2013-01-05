#!/usr/bin/env coffee

request = require 'request'

# ===========================================================================

findBufferTweets = (search_term, refresh_url, cb) ->

  if not refresh_url?
    refresh_url = cb
    cb = null

  if not cb?
    cb = refresh_url
    refresh_url = "?q=source%3Abuffer%20#{search_term}&include_entities=true"

  oauth = 
    consumer_key: "8YViupFzAsvFbYufbtLiSA"
    consumer_secret: "6O5IlF398xHIdcMOcF9frlAV0d2x4YtmuenDTtFs"
    token: "104214121-rwi0XVaT11MmJNOjkw9hbxGxMSbTFD28GSitKSp8"
    token_secret: "6iJqgAQI0HQHvi9EMbt7SxV7ZaQj036Oyn7lQlT1rQ"

  options =
    url: "https://api.twitter.com/1.1/search/tweets.json#{refresh_url}"
    oauth: oauth

  request.get options, (err, resp, body) ->
    if err? then return cb err
    try
      json = JSON.parse body
    catch e
      return cb 'Failed to parse JSON'
    cb null, json

# ===========================================================================

display_results = (err, data) ->
  if err? then return console.log "ERROR: #{err}"
  for status in data.statuses
    if status.source.match /bufferapp/  
      console.log "#{status.user.screen_name}"
      console.log "  #{url.display_url}" for url in status.entities?.urls

# ===========================================================================

main_loop = (search_term, refresh_url) ->

  cb = () =>
    findBufferTweets search_term, refresh_url, (err, data) ->
      display_results err, data
      refresh_url = data.search_metadata.refresh_url
      console.log 'Slight pause...'
      main_loop search_term, refresh_url
  setTimeout cb, 20000

# ===========================================================================

search_term = process.argv[2]
main_loop search_term

