$(document).ready(function() {
  var fields = {
    'address': false,
    'start': false,
    'end': false
  }

  $('button')[0].disabled = true;

  $('.form-control').focusout(function(event) {
    console.log("all")
    if (this.value != "") {
      fields[this.name] = true;
      $(event.target.parentElement).addClass('has-success')
      console.log(event.target.parentElement);
    } else {
      fields[this.name] = false;
      $(event.target.parentElement).addClass('has-error')
      console.log(event.target.parentElement);
    }
    allTrue()
  })

  function allTrue() {
    var completed = false;
    Object.values(fields).forEach(function (value) {
      if (!value) {
        completed = true;
      }
    })
    $('button')[0].disabled = completed;
  }


});
