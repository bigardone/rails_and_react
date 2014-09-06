# @cjsx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'
  render: ->
    <div className="filter-wrapper">
      <div className="form-wrapper">
        <form>
          <input placeholder="Search people..." type="search"/>
        </form>
      </div>
    </div>
