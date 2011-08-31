Handlebars.registerHelper('statuses', function(fn) {
  var statuses = ["Pending", "Started", "Completed", "Delivered", "Approved", "Rejected"],
      result = '',
      status;

  for(var i in statuses) {
    status = statuses[i];
    result += fn({name: status, value: status.toLowerCase(), selected: this.status == status.toLowerCase()});
  }

  return new Handlebars.SafeString(result);
});

// There's got to be an easier way to do all this :(
Handlebars.registerHelper('isPending', function(fn) {
  if (this.status == 'pending') {
    return fn(this);
  }
});
Handlebars.registerHelper('isStarted', function(fn) {
  if (this.status == 'started') {
    return fn(this);
  }
});
Handlebars.registerHelper('isCompleted', function(fn) {
  if (this.status == 'completed') {
    return fn(this);
  }
});
Handlebars.registerHelper('isDelivered', function(fn) {
  if (this.status == 'delivered') {
    return fn(this);
  }
});
Handlebars.registerHelper('isRejected', function(fn) {
  if (this.status == 'rejected') {
    return fn(this);
  }
});
Handlebars.registerHelper('isApproved', function(fn) {
  if (this.status == 'approved') {
    return fn(this);
  }
});
