$(document).ready(function(){


  $('#profileForm2').hide();

  $('#bajs').click(function(event){
    event.prevent.Default();
    $('profileForm1').hide();
    $('profileForm2').show();
  });

});
