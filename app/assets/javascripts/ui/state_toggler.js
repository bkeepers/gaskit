jQuery(function() {
  $('a.state-changer').live('click', function(e) {
    e.preventDefault();
    $(this).closest('.editable').toggleClass('edit');
  });
});