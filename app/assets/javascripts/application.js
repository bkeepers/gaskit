//= require ./lib/jquery
//= require_tree ./lib
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./ui
//= require_tree ./helpers

var ApplicationController = Spine.Controller.create({
  init: function() {
    StoryListController.init({el: $('#container')});
    NewStoryController.init({el: $('article')});
    Spine.Route.setup();
  }
});


jQuery(function($) {
  window.application = ApplicationController.init();
});