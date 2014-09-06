# @cjsx React.DOM

ReactCSSTransitionGroup = React.addons.CSSTransitionGroup

@PeopleSection = React.createClass
  displayName: 'PeopleSection'

  getInitialState: ->
    didFetchData: false
    people: []

  componentDidMount: ->
    @_fetchPeople({})

  _fetchPeople: (data)->
    $.ajax
      url: Routes.people_path()
      dataType: 'json'
      data: data
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    return false unless @isMounted()
    @setState
      didFetchData: true
      people: data

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  _handleOnSearchSubmit: (search) ->
    @_fetchPeople
      search: search

  render: ->
    cardsNode = @state.people.map (person) ->
      <PersonCard key={person.id} data={person}/>

    noDataNode =
      <div className="warning">
        <span className="fa-stack">
          <i className="fa fa-meh-o fa-stack-2x"></i>
        </span>
        <h4>No people found...</h4>
      </div>

    <div>
      <PeopleSearch onFormSubmit={@_handleOnSearchSubmit}/>
      <div className="cards-wrapper">
        {
          if @state.people.length > 0
            <ReactCSSTransitionGroup transitionName="card">
              {cardsNode}
            </ReactCSSTransitionGroup>
          else if @state.didFetchData
            {noDataNode}
        }
      </div>
    </div>
