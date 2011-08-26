var TaskController = Spine.Controller.create({
  init: function(){
    this.task.bind("update",  this.proxy(this.render));
    this.task.bind("destroy", this.proxy(this.remove));
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
