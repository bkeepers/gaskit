$('.segmented input:radio').live('change', function() {
  $(this).closest('.segmented').find('label.selected').removeClass('selected');
  $(this).closest('label').addClass('selected');
});
