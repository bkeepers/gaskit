Handlebars.registerHelper('users', function(fn) {
  var users = User.all(), result = '';

  for(var i in users) {
    user = users[i];
    if(this.owner_email == user.email) { user.selected = true; }
    result += fn(user);
  }

  return result;
});
