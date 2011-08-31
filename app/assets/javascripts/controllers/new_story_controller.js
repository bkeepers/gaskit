var NewStoryController = Spine.Controller.create({
  elements: {'#new_story': 'form'},
  events:   {'submit #new_story': 'create'},

  init: function() {
    this.routes({
      '/stories/new': this.render
    });
  },

  create: function(e) {
    e.preventDefault();
    var data = this.form.serializeForm();
    var story = Story.create(data);
    this.form.clearForm();
    this.navigate('/stories/' + story.id, true);
  },

  render: function() {
    this.html(this.template());
    return this;
  },

  template: function() {
    template = Handlebars.compile($('#new-story-template').html());
    return template();
  }
});