var StoryController = Spine.Controller.create({
  elements: {'form': 'form'},
  events:   {'submit form': 'update', 'click .destroy': 'destroy'},

  init: function(){
    this.story.bind("update",  this.proxy(this.render));
    this.story.bind("destroy", this.proxy(this.remove));
  },

  render: function() {
    this.replace($(this.template(this.story))).data('model', this.story);
    return this;
  },

  template: function(story) {
    var template = StoriesController.template;
    if(!template) {
      template = StoriesController.template = Handlebars.compile($('#story-template').html());
    }
    return template(story);
  },

  remove: function(){
    this.el.remove();
  },

  update: function(e) {
    e.preventDefault();
    this.story.updateAttributes(this.form.serializeForm());
  },

  destroy: function(e) {
    e.preventDefault();
    this.story.destroy();
  }

});
