$ ->
  $myScrollContainer = $ 'ul#my-scroll-container'
  myHelix = new Helix $myScrollContainer,
    requestModels: (startIndex, count, supplyModels) ->
      console.log "Requesting models for range #{startIndex}: #{(startIndex + count - 1)}."

      models = []
      for index in [0..(count - 1)]
        models.push (startIndex + index)
      supplyModels models
      return

    requestElement: (model) ->
      return $("<span>#{model}</span>")
  return
