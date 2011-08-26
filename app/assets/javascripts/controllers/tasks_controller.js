var TasksController = Spine.Controller.create({
  elements: {'#new_task': 'form', '#tasks': 'tasks'},
  events:   {'submit #new_task': 'create'},

  init: function() {
    Task.bind('create', this.proxy(this.add));
  },

  create: function(e) {
    e.preventDefault();
    var data = this.form.serializeForm();
    Task.create(data);
  },

  add: function(task) {
    var controller = TaskController.init({task: task});
    this.tasks.append(controller.render().el);
  }
});
