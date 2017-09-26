$ ->
  action = $('.pages-tree').data('url')

  sortable(
    'ul.pages',
    handle:               'i.glyphicon-resize-vertical',
    forcePlaceholderSize: true
  )

  $('ul.pages').on 'sortupdate', (e) ->
    item = $(e.detail.item)

    $.ajax
      url:      action + "/#{item.data('id')}",
      dataType: 'json'
      method:   'PUT',
      data:     { page: { position: item.index() } }
