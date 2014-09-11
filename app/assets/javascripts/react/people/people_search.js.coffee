# @cjsx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  componentDidMount: ->
    @_subscribeToEvents()

  componentWillUnmount: ->
    @_unsubscribeFromEvents()

  _subscribeToEvents: ->
    PubSub.subscribe 'resetButton:onClick', ()=>
      @refs.search.getDOMNode().value = ''

  _unsubscribeFromEvents: ->
    PubSub.unsubscribe 'resetButton:onClick'

  _handleOnSubmit: (e) ->
    e.preventDefault()

    searchValue = @refs.search.getDOMNode().value.trim()
    @props.onFormSubmit(searchValue)

  _personText: (count) ->
    if count > 1 then 'people' else 'person'

  render: ->
    count = @props.meta.total_count
    personText = @_personText(count)
    overviewTitle = if @props.meta.total_count > 0 then "#{count} #{personText} found"

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
