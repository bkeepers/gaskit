var Story = Spine.Model.setup('Story', 'description', 'status', 'position', 'owner_email');

Story.extend(Spine.Model.Ajax).extend({
  url: '/stories'
});

Story.include({
  title: function() {
    return this.description.split("\n")[0];
  },

  positionBetween: function(prev, next) {
    prev = prev || 0;
    next = next || 1;
    this.position = (next - prev) / 2 + prev;
  },

  owner: function() {
    return User.findByAttribute('email', this.owner_email);
  }
});

Story.bind("beforeCreate", function(story) {
  var last = Story.last();
  story.positionBetween(last ? last.position : 0, 1);
});
