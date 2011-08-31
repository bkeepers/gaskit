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

    var setup = function() {
      Spine.Route.setup();
      Story.unbind('refresh', setup);
    }
    Story.bind('refresh', setup);
  }
});


jQuery(function($) {
  window.application = ApplicationController.init();
});