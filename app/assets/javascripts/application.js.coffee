#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require react
#= require react_ujs
#= require moment
#= require js-routes
#= require nprogress
#= require nprogress-turbolinks
#= require nprogress-ajax
#= require pubsub

#= require_tree ./utils
#= require_tree ./react

$ ->
  NProgress.configure
    showSpinner: false
    ease: 'ease'
    speed: 500
