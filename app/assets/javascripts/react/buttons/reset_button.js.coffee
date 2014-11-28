# @cjsx React.DOM

@ResetButton = React.createClass
  displayName: 'ResetButton'

  _handleOnClick: (e) ->
    e.preventDefault()
    PubSub.publish 'resetButton:onClick'

  render: ->
    <a className={@props.styleClass} href="#" onClick={@_handleOnClick}>{@props.text}</a>

