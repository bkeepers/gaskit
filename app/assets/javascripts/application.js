//= require ./lib/jquery
//= require_tree ./lib
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./ui
//= require_tree ./helpers

var ApplicationController = Spine.Controller.create({
  init: function() {
    this.story = StoriesController.init({el: $('#main')});
  }
});


jQuery(function($) {
  window.application = ApplicationController.init();
});