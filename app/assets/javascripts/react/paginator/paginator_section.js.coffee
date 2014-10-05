# @cjsx React.DOM

@PaginatorSection = React.createClass
  displayName: 'PaginatorSection'

  handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  render: ->
    if @props.totalPages > 0
      <ul className="pagination">
        {
          if @props.totalPages > 1
            for i in [1..@props.totalPages]
              <li key={i}>
                {
                  if i == @props.currentPage
                    <span>&nbsp;</span>
                  else
                    <PaginatorLink pageNumber={i} onPaginatorLinkClick={@handleOnClick} />
                }
              </li>

        }
      </ul>
    else
      <div>&nbsp;</div>

