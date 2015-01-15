
require! <[ marked to-slug-case rss moment ]>

# configuration options

const site-title = "Alex Savin blog"
const cut-mark = /\nMore...\n/i
const posts-per-page = 5

# internal helpers

document-name = split '/' >> last >> split '.' >> first

contains = (a, b) --> (b.index-of a) isnt -1
is-type = (a, item) --> contains a, item.path
is-post-eng = is-type '/eng/posts/'
is-post-ru = is-type '/ru/posts/'
page-number = 0

# document indexes
posts-eng = []
posts-ru = []

tags = {}

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
  post.postdate = format-date it.attributes.date

  post

format-date = ->
  moment it .format 'DD MMM YYYY'

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
        console.log item.attributes.tags
        if item.attributes.[]tags?
          item.attributes.tags |> each ->
            if tags[it] is undefined then tags[it]:= []
            tags[it].push (make-post item)
      | is-post-ru item
        posts-ru.push (make-post item)
      item.attributes.date = format-date item.attributes.date

      console.log item.path
      console.log tags

    # Generator will take items array and generate all static
    # files based on that. This means we can append more stuff
    # into items and have some dynamic pages generated.

    # Paginate posts on index page
    # 5 posts per page

    # Generating virtual index pages as long as
    # there is enough items

    posts-remaining = reverse posts-eng

    console.log 'Paginating...'

    while posts-remaining.length > 0
      console.log "Generating page #{page-number}"
      posts-page = take posts-per-page, posts-remaining
      posts-remaining = drop posts-per-page, posts-remaining
      page-number:= page-number + 1

      page =
        attributes:
          name: "Page #{page-number}"
          layout: 'page.jade'
          url: "/eng/pages/#{page-number}/index.html"
          items: posts-page
          page-number: page-number
          next-page-number: page-number + 1
          more-pages-available: posts-remaining.length > 0
        body: '' # Empty body since we pass all items in attr
        path: "src/documents/pages/#{page-number}.md"
        outpath: "out/eng/pages/#{page-number}/index.html"
        type: 'md'

      items = items.concat page

    items

  globals: (items) ->
    console.log "Preparing globals..."

    fs.writeFile 'out/feed-eng.xml', (export-feed posts-eng), (err) ->
      throw err if err

    fs.writeFile 'out/feed-ru.xml', (export-feed posts-ru), (err) ->
      throw err if err

    title: ->
      if it.title  then "#{it.title} | #site-title" else site-title

    posts-eng: reverse posts-eng |> take posts-per-page
    posts-ru: reverse posts-ru
    pages-available: page-number > 1
