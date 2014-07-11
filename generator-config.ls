
require! <[ marked to-slug-case rss moment ]>

# configuration options

site-title = "Alex Savin blog"
cut-mark = /\nMore...\n/i

# internal helpers

document-name = split '/' >> last >> split '.' >> first

contains = (a, b) --> (b.index-of a) isnt -1
is-type = (a, item) --> contains a, item.path
is-post-eng = is-type '/eng/posts/'
is-post-ru = is-type '/ru/posts/'

# document indexes

documents-by-path = {}
posts-eng = []
posts-ru = []

make-post = ->
  post = {}
  mark = []
  console.log cut-mark.test it.body

  # Check if we have cut mark
  if (cut-mark.test it.body) is true
    mark = lines (it.body.match cut-mark).0
    post-parts = split '\n' + mark.1 + '\n' it.body
    post.preview = marked post-parts.0
    post.body = marked join '\n' post-parts
    post.read-more = true
  else
    post.body = marked it.body
    post.preview = post.body
    post.read-more = false

  post.title = it.attributes.name
  post.url = it.attributes.url
  post.date = it.attributes.date


  post

export-feed = ->


  rssfeed = new rss do
    title: 'Alexander Savin blog'
    description: 'Posts in english'
    site_url: 'http://alexsavin.me/'
    feed_url: 'http://alexsavin.me/feed.xml'
    image_url: 'http://alexsavin.me/images/rss.png'
    copyright: 'Creative Commons Attribution 4.0 International (CC BY 4.0)'
    #author: 'Alexander Savin'

  for post in it
    rssfeed.item {
      title: post.title
      url: "http://alexsavin.me#{post.url}"
      description: post.preview
      date: new Date post.date
    }

  rssfeed.xml!

module.exports =

  prepare: (items) ->
    console.log "Preparing items..."

    items |> each (item) ->
      | is-post-eng item
        posts-eng.push (make-post item)
      | is-post-ru item
        posts-ru.push (make-post item)

      console.log item.path
      documents-by-path[item.path] = item

  globals: (items) ->
    console.log "Preparing globals..."

    fs.writeFile 'out/feed-eng.xml', (export-feed posts-eng), (err) ->
      throw err if err

    fs.writeFile 'out/feed-ru.xml', (export-feed posts-ru), (err) ->
      throw err if err

    title: ->
      if it.title  then "#{it.title} | #site-title" else site-title

    posts-eng: posts-eng
    posts-ru: posts-ru
