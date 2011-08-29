var Task = Spine.Model.setup('Task', 'description', 'status', 'position');

Task.extend(Spine.Model.Ajax);

Task.include({
  positionBetween: function(prev, next) {
    prev = prev || 0;
    next = next || 1;
    this.position = (next - prev) / 2 + prev;
  }
});

Task.bind("beforeCreate", function(task) {
  var last = Task.last();
  task.positionBetween(last ? last.position : 0, 1);
});
