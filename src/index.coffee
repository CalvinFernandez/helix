init   = require './init.coffee'
logger = require './helpers/logger.coffee'

class Helix
  ###
  Constructor.

  @param {jQuery Element} $scrollContainer The container for the scroll view.
                                           List items will be appended into
                                           this element.
  @param {Object} options                  The options hash. For a full list
                                           of valid entries, reference the
                                           README.

                                           Required params:
                                           {
                                             requestModels: @{Function (
                                               @{Number} startIndex,
                                               @{Number} count,
                                               @{Function} supplyModels
                                             )},

                                             requestElement: @{Function (
                                               @{Anything} model
                                             )}
                                           }

  @returns {Object} A helix instance when invoked with "new".
  ###
  constructor: (@$scrollContainer, options) ->
    @scrollHeight = $scrollContainer.height()

    {@requestModels, @requestElement} = options
    unless @requestModels?
      logger.error 'requestModels method was not supplied on instantiation.'
      return
    unless @requestElement?
      logger.error 'requestElement method was not supplied on instantiation.'
      return

    @wasInsertedIntoDOM = init.option options, 'wasInsertedIntoDOM'
    @willBeRemovedFromDOM = init.option options, 'willBeRemovedFromDOM'
    @resizeThrottle = init.option options, 'resizeThrottle'
    @scrollThrottle = init.option options, 'scrollThrottle'
    @numElementsInScrollViewport = init.option options,
        'numElementsInScrollViewport'

    @cacheOptions = init.option options, 'cache'
    if @cacheOptions
      @cacheOptions = init.getCacheOptions @cacheOptions
      init.heighCache @

    init.listItems @
    init.scrollEvent @
    return

  # TODO
  setViewportHeight: (viewportHeight) -> return
  # TODO
  setElementHeight: (elemHeight) -> return
  # TODO
  setElementHeightAtIndex: (elemIndex, elemHeight) -> return

###
Main Export
###
window.Helix = Helix
