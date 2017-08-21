$ ->
  init_sortable = ->
    sortable(
      'div#blocks',
      handle:               'i.glyphicon-resize-vertical',
      forcePlaceholderSize: true
    )

  $('div#blocks').on 'cocoon:after-insert', ->
    init_sortable()

  init_sortable()

  $('div#blocks').on 'sortupdate', (e) ->
    $('> .nested-fields', this).map (position) ->
      $(this).find('input[id$=_position]').val(position)
