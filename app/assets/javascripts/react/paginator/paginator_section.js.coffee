# @cjsx React.DOM

@PaginatorSection = React.createClass
  displayName: 'PaginatorSection'

  handleOnClick: (pageNumber) ->
    @props.onPaginate(pageNumber)

  render: ->
    if @props.meta.total_pages > 0
      <ul className="pagination">
        {
          if @props.meta.total_pages > 1
            for i in [1..@props.meta.total_pages]
              <li key={i}>
                {
                  if i == @props.meta.current_page
                    <span>&nbsp;</span>
                  else
                    <PaginatorLink pageNumber={i} onPaginatorLinkClick={@handleOnClick} />
                }
              </li>

        }
      </ul>
    else
      <div>&nbsp;</div>

