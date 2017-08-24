$(document).ready(function(){

  $('.profile-info-container input').hide();
  $('.profile-info-container .attachinary').hide()
  // $('.attachinary').hide();

  $('#editProfile').click(function(event){
    event.preventDefault();
    $('.profile-info-container label').hide();
    $('.profile-info-container input').show();
    $('.profile-info-container .attachinary').show()
    this.hide();
  });

});
