# @cjsx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  _handleOnSubmit: (e) ->
    e.preventDefault()

    searchValue = @refs.search.getDOMNode().value.trim()
    @props.onFormSubmit(searchValue)

  render: ->
    overviewTitle = if @props.meta.total_count > 0 then "#{@props.meta.total_count} people found"
    <div className="filter-wrapper">
      <div className="overview-wrapper">
        <h3>{overviewTitle}</h3>
        &nbsp;
      </div>
      <div className="form-wrapper">
        <form onSubmit={@_handleOnSubmit}>
          <input ref="search" placeholder="Search people..." type="search"/>
        </form>
      </div>
    </div>
