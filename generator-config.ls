

# configuration options

site-title = "Alex Savin blog"

# internal helpers

document-name = split '/' >> last >> split '.' >> first

contains = (a, b) --> (b.index-of a) isnt -1
is-type = (a, item) --> contains a, item.path

# document indexes

documents-by-path = {}

module.exports =
  prepare: (items) ->
    console.log "Preparing"

    items |> each ->
      console.log it.path
      documents-by-path[it.path] = it

  globals: (items) ->
    console.log "Figuring out globals"

    title: ->
      if it.title  then "#{it.title} | #site-title" else site-title
