// handlebars doesn't invoke properties that are functions. This is an ugly hack to do that
Handlebars.registerHelper('f', function(fn, block) {
  var val = fn.apply(this);
  if(val) {
    return typeof block == 'function' ? block(val) : val;
  }
});
