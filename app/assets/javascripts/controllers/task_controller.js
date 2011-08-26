var TaskController = Spine.Controller.create({
  proxied: ["render", "remove"],

  init: function(){
    this.task.bind("update",  this.render);
    this.task.bind("destroy", this.remove);
  },

  render: function(){
    this.el.html(this.template(this.task));
    return this;
  },

  template: function(task) {
    var template = TasksController.template;
    if(!template) {
      template = TasksController.template = Handlebars.compile($('#task-template').html());
    }
    return template(task)
  },

  remove: function(){
    this.el.remove();
  }
});
