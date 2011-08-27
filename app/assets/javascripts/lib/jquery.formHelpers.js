jQuery.fn.clearForm = function(){
  $.each($(this).find('input[type=text], input[type=radio], input[type=checkbox], select, textarea'), function(i, item){
    $(item).val('');
  });
  return $(this);
};