class Cache
  constructor: ->
    # TODO: Use an AVL tree instead https://github.com/vhmth/helix/issues/1
    @cache = []

  get: (key) ->
    @cache[key]

  set: (key, value) ->
    @cache[key] = value
    return

module.exports = Cache
