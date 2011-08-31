var StoryController = Spine.Controller.create({
  elements: {'form': 'form'},
  events:   {
    'submit form':    'update',
    'click .destroy': 'destroy'
  },

  init: function() {
    this.story.bind("update", this.proxy(this.render));
    this.story.bind("destroy", this.proxy(this.remove));
  },

  render: function() {
    this.html(this.template());
    return this;
  },

  template: function() {
    template = Handlebars.compile($('#edit-story-template').html());
    return template(this.story);
  },

  update: function(e) {
    e.preventDefault();
    this.story.updateAttributes(this.form.serializeForm());
  },

  destroy: function(e) {
    e.preventDefault();
    this.story.destroy();
  },

  remove: function() {
    this.el.html('');
  }
});
