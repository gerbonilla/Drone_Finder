$(document).ready(function() {
  $('.date').on("change", function(){

    // get values from date inputs

    start_year = Math.floor($('.form-control')[0].value);
    start_month = Math.floor($('.form-control')[1].value);
    start_day = Math.floor($('.form-control')[2].value);
    start_date_new = new Date(start_year, start_month, start_day);

    end_year = Math.floor($('.form-control')[3].value);
    end_month = Math.floor($('.form-control')[4].value);
    end_day = Math.floor($('.form-control')[5].value);
    end_date_new = new Date(end_year, end_month, end_day);

    // calculate number of days
    var difference =  Math.floor(( Date.parse(end_date_new) - Date.parse(start_date_new)) / 86400000);
    // calc total amount
    price = Number($('#price').text());
    var total_amount = difference * price
    // change total amount on page
    if (total_amount >= 0) {
      $('#total_amount').text(total_amount)
    } else {
      $('#total_amount').text(0)
      alert("end_date must be after start_date")
    };
  });
});
