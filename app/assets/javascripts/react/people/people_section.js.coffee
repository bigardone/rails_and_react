# @cjsx React.DOM

@PeopleSection = React.createClass
  displayName: 'PeopleSection'

  getInitialState: ->
    didFetchData: false
    people: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
    fetchData:
      search: ''
      page: 1

  componentDidMount: ->
    @_subscribeToEvents()
    @_fetchPeople({})

  componentWillUnmount: ->
    @_unsubscribeFromEvents()

  _subscribeToEvents: ->
    PubSub.subscribe 'resetButton:onClick', ()=>
      @state.fetchData =
        search: ''
        page: 1

      @_fetchPeople()

  _unsubscribeFromEvents: ->
    PubSub.unsubscribe 'resetButton:onClick'

  _fetchPeople: ()->
    $.ajax
      url: Routes.people_path()
      dataType: 'json'
      data: @state.fetchData
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    return false unless @isMounted()
    @setState
      didFetchData: true
      people: data.people
      meta: data.meta

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  _handleOnSearchSubmit: (search) ->
    @state.fetchData=
      search: search
      page: 1

    @_fetchPeople()

  _handleOnPaginate: (pageNumber) ->
    @state.fetchData.page = pageNumber
    @_fetchPeople()

  render: ->
    cardsNode = @state.people.map (person) ->
      <PersonCard key={person.id} data={person}/>

    noDataNode =
      <div className="warning">
        <span className="fa-stack">
          <i className="fa fa-meh-o fa-stack-2x"></i>
        </span>
        <h4>No people found...</h4>
        <ResetButton text="Reset filter" styleClass="btn" />
      </div>

    <div>
      <PeopleSearch totalCount={@state.meta.total_count} onFormSubmit={@_handleOnSearchSubmit}/>
      <PaginatorSection totalPages={@state.meta.total_pages} currentPage={@state.meta.current_page} onPaginate={@_handleOnPaginate}/>
      <div className="cards-wrapper">
        {
          if @state.people.length > 0
            {cardsNode}
          else if @state.didFetchData
            {noDataNode}
        }
      </div>
      <PaginatorSection totalPages={@state.meta.total_pages} currentPage={@state.meta.current_page} onPaginate={@_handleOnPaginate}/>
    </div>
