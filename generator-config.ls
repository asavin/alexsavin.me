
require! <[ marked ]>

# configuration options

site-title = "Alex Savin blog"

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
  post.body = marked it.body
  post.title = it.attributes.name
  post

module.exports =

  prepare: (items) ->
    console.log "Preparing"

    items |> each (item) ->
      | is-post-eng item
        posts-eng.push (make-post item)
      | is-post-ru item
        posts-ru.push (make-post item)

      console.log item.path
      documents-by-path[item.path] = item

  globals: (items) ->
    title: ->
      if it.title  then "#{it.title} | #site-title" else site-title

    posts-eng: posts-eng
    posts-ru: posts-ru
