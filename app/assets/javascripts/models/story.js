var Story = Spine.Model.setup('Story', 'description', 'type', 'status', 'position', 'owner_email');

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
  },

  isFeature: function() {
    return this.type == 'feature' || !this.type;
  },

  isBug: function() {
    return this.type == 'bug';
  },

  isRelease: function() {
    return this.type == 'release';
  }
});

Story.bind("beforeCreate", function(story) {
  var last = Story.last();
  story.positionBetween(last ? last.position : 0, 1);
});
