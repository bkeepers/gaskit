// http://maccman.github.com/spine.tutorials/form.html
jQuery.fn.serializeForm = function(){
  var result = {};
  $.each($(this).serializeArray(), function(i, item){
    result[item.name] = item.value;
  });
  return result;
};