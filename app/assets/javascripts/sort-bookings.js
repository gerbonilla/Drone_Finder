$(document).ready(function(){






 $(function(){
   var tableRow = $('#userBookings').find('tr').sort(sortByClass);
   $('#userBookings').append(tableRow);
 });

 function sortByClass(a, b) {
        return a.className < b.className;
  }


});
