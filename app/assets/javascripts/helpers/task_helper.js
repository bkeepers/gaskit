Handlebars.registerHelper('statuses', function(fn) {
  var statuses = ["Pending", "Started", "Completed", "Delivered", "Approved", "Rejected"],
      result = '',
      status;

  for(var i in statuses) {
    status = statuses[i];
    console.log('evaluating', status, this.status)
    result += fn({name: status, value: status.toLowerCase(), selected: this.status == status.toLowerCase()});
  }

  return new Handlebars.SafeString(result);
});
