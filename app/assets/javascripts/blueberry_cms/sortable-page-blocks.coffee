initSortable = ->
  sortable(
    '#blocks',
    handle:               'i.glyphicon-resize-vertical',
    forcePlaceholderSize: true
  )

initSortable()
$('#blocks').on 'cocoon:after-insert', ->
  initSortable()

$('#blocks').on 'sortupdate', (e) ->
  $('> .nested-fields', this).map (position) ->
    $(this).find('input[id$=_position]').val(position)
