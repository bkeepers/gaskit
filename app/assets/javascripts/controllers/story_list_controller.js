var StoryListController = Spine.Controller.create({
  elements: {'#stories': 'stories', '#editor': 'editor'},

  init: function() {
    Story.fetch();
    Story.bind('create', this.proxy(this.add));
    Story.bind('refresh', this.proxy(this.addAll));
    Story.bind('create destroy refresh', this.updateCounts)

    this.stories.sortable({
      axis: 'y',
      update: this.proxy(this.sort)
    });

    this.routes({
      '/stories/:id': this.show
    });
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
  },

  show: function(params) {
    this.stories.find('.active').removeClass('active');
    this.stories.find('#story-' + params.id).addClass('active');
    this.editor.html(StoryController.init({story: Story.find(params.id)}).render().el);
  },

  updateCounts: function() {
    $('#all-stories .label, #features .label').text(Story.count());
  }

});
