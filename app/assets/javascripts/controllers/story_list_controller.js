var StoryListController = Spine.Controller.create({
  elements: {'#new_story': 'form', '#stories': 'stories'},
  events:   {'submit #new_story': 'create'},

  init: function() {
    Story.fetch();
    Story.bind('create', this.proxy(this.add));
    Story.bind('refresh', this.proxy(this.addAll));

    this.stories.sortable({
      axis: 'y',
      update: this.proxy(this.sort)
    });
  },

  create: function(e) {
    e.preventDefault();
    var data = this.form.serializeForm();
    Story.create(data);
    this.form.clearForm();
  },

  add: function(story) {
    var controller = StoryListItemController.init({story: story});
    this.stories.append(controller.render().el);
  },

  addAll: function(stories) {
    Story.each(this.proxy(this.add));
  },

  sort: function(event, ui) {
    var story = ui.item.data('model'),
        prev = ui.item.prev().data('model'),
        next = ui.item.next().data('model');
        prevPosition = prev ? prev.position || 0 : 0,
        nextPosition = next ? next.position || 1 : 1;

    story.positionBetween(prevPosition, nextPosition);
    story.save();
  }
});
