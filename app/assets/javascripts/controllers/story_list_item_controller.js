var StoryListItemController = Spine.Controller.create({
  init: function() {
    this.story.bind("update",  this.proxy(this.render));
    this.story.bind("destroy", this.proxy(this.remove));
  },

  render: function() {
    this.replace($(this.template())).data('model', this.story);
    return this;
  },

  template: function() {
    var template = StoryListItemController.template;
    if(!template) {
      template = StoryListItemController.template = Handlebars.compile($('#story-template').html());
    }
    return template(this.story);
  },

  remove: function(){
    this.el.remove();
  }
});
