var TaskController = Spine.Controller.create({
  elements: {'form': 'form'},
  events:   {'submit form': 'update', 'click .destroy': 'destroy'},

  init: function(){
    this.task.bind("update",  this.proxy(this.render));
    this.task.bind("destroy", this.proxy(this.remove));
  },

  render: function() {
    this.replace($(this.template(this.task))).data('model', this.task);
    return this;
  },

  template: function(task) {
    var template = TasksController.template;
    if(!template) {
      template = TasksController.template = Handlebars.compile($('#task-template').html());
    }
    return template(task);
  },

  remove: function(){
    this.el.remove();
  },

  update: function(e) {
    e.preventDefault();
    this.task.updateAttributes(this.form.serializeForm());
  },

  destroy: function(e) {
    e.preventDefault();
    this.task.destroy();
  }

});
