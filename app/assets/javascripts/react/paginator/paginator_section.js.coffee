# @cjsx React.DOM

@PaginatorSection = React.createClass
  displayName: 'PaginatorSection'

  _handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  render: ->
    if @props.totalPages > 1
      <ul className="pagination">
        {
          for i in [1..@props.totalPages]
            <li key={i}>
              {
                if i == @props.currentPage
                  <span>&nbsp;</span>
                else
                  <PaginatorLink pageNumber={i} onPaginatorLinkClick={@_handleOnClick} />
              }
            </li>
        }
      </ul>
    else
      <div>&nbsp;</div>

