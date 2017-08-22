$(document).ready(function(){


  $('#profileForm2').hide();

  $('#editProfile').click(function(event){
    event.preventDefault();
    $('#profileForm1').hide();
    $('#profileForm2').show();
  });

});
