Cache         = require './cache.coffee'
logger        = require './helpers/logger.coffee'
objectHelpers = require './helpers/object.coffee'

DEFAULT_INIT_OPTIONS =
  cache: false
  numElementsInScrollViewport: 20
  resizeThrottle: 200
  scrollThrottle: 200

DEFAULT_INIT_CACHE_OPTIONS =
  flushOnResize: false

LIST_ITEM_CLASS = 'helix-item'

###
  Return the value pointed to by options[key]. If options[key] does not exist,
  DEFAULT_INIT_OPTIONS[key] is returned.

  @param {Object} options The options passed into the Helix constructor.
  @param {String} key     The key to check against.

  @returns {Anything} Any valid value that can be pointed to by options[key]
                      or DEFAULT_INIT_OPTIONS[key].
###
exports.option = (options, optionKey) ->
  return objectHelpers.getValue options, optionKey, DEFAULT_INIT_OPTIONS

###
  Return a final cache options hash with defaulted values from
  DEFAULT_INIT_CACHE_OPTIONS.

  @param {Object|Booleaon} cacheOptions The option passed into the Helix
                                        constructor.
###
exports.getCacheOptions = (cacheOptions) ->
  return DEFAULT_INIT_CACHE_OPTIONS if typeof cacheOptions isnt 'object'
  finalCacheOptions = {}
  for cacheOptionKey of DEFAULT_INIT_CACHE_OPTIONS
    finalCacheOptions[cacheOptionKey] =
        _cacheOption cacheOptions, cacheOptionKey
  return finalCacheOptions

# TODO
exports.heightCache = (instance) ->
  instance.heightCache = new Cache()
  return

###
  Populate a helix instance's scroll container with list items.

  @param {Object} instance The helix instance whose $scrollContainer should be
                           populated.
###
exports.listItems = (instance) ->
  listItemString = "<li class=\"#{LIST_ITEM_CLASS}\"></li>"
  {$scrollContainer} = instance
  numElements = instance.numElementsInScrollViewport

  $scrollContainer.html('')
  for item in [0..(numElements - 1)]
    $scrollContainer.append listItemString
  return

# TODO
exports.scrollEvent = (instance) ->
  {$scrollContainer} = instance

  $scrollContainer.scroll ->
    return
  return

###
  Return the value pointed to by options[key]. If options[key] does not exist,
  DEFAULT_INIT_CACHE_OPTIONS[key] is returned.

  @param {Object} options The cache options passed into the Helix constructor.
  @param {String} key     The key to check against.

  @returns {Anything} Any valid value that can be pointed to by options[key]
                      or DEFAULT_INIT_CACHE_OPTIONS[key].
###
_cacheOption = (options, optionKey) ->
  return objectHelpers.getValue options, optionKey, DEFAULT_INIT_CACHE_OPTIONS
