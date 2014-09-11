# @cjsx React.DOM

@PaginatorLink = React.createClass
  displayName: 'PaginatorLink'

  _handleOnClick: (e) ->
    e.preventDefault()
    @props.onPaginatorLinkClick(@props.pageNumber)

  render: ->
    <a href="#" onClick={@_handleOnClick}>&nbsp;</a>
