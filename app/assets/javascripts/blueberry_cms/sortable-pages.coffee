$ ->
  $("ul.pages").sortable(
    handle: 'i.glyphicon-resize-vertical',
    forcePlaceholderSize: true)
  .bind('sortupdate', (e, data) ->
    index = data.item.index()
    id    = data.item.data('id')
    console.log {id, index}
  )
