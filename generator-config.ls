
require! <[ marked ]>

# configuration options

site-title = "Alex Savin blog"

# internal helpers

document-name = split '/' >> last >> split '.' >> first

contains = (a, b) --> (b.index-of a) isnt -1
is-type = (a, item) --> contains a, item.path
is-post = is-type '/posts/'

# document indexes

documents-by-path = {}
posts = []

module.exports =
  prepare: (items) ->
    console.log "Preparing"

    items |> each (item) ->
      | is-post item
        post = {}
        post.body = marked item.body
        post.title = item.attributes.name
        posts.push post

      console.log item.path
      documents-by-path[item.path] = item

  globals: (items) ->
    console.log "Figuring out globals"
    console.log posts

    title: ->
      if it.title  then "#{it.title} | #site-title" else site-title

    posts: posts
