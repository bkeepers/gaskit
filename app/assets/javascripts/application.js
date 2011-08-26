//= require_tree ./lib
//= require_tree ./models
//= require_tree ./controllers

var ApplicationController = Spine.Controller.create({
  init: function() {
    this.tasks = TasksController.init({el: $('#main')});
  }
});


jQuery(function($) {
  window.application = ApplicationController.init();
});