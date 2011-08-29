var TasksController = Spine.Controller.create({
  elements: {'#new_task': 'form', '#tasks': 'tasks'},
  events:   {'submit #new_task': 'create'},

  init: function() {
    Task.fetch();
    Task.bind('create', this.proxy(this.add));
    Task.bind('refresh', this.proxy(this.addAll));

    this.tasks.sortable({
      axis: 'y',
      update: this.proxy(this.sort)
    });
  },

  create: function(e) {
    e.preventDefault();
    var data = this.form.serializeForm();
    Task.create(data);
    this.form.clearForm();
  },

  add: function(task) {
    var controller = TaskController.init({task: task});
    this.tasks.append(controller.render().el);
  },

  addAll: function(tasks) {
    Task.each(this.proxy(this.add));
  },

  sort: function(event, ui) {
    var task = ui.item.data('model'),
        prev = ui.item.prev().data('model'),
        next = ui.item.next().data('model');
        prevPosition = prev ? prev.position || 0 : 0,
        nextPosition = next ? next.position || 1 : 1;

    task.positionBetween(prevPosition, nextPosition);
    task.save();
  }
});
