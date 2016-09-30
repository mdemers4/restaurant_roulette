$(function() {

    var _restaurant, _date, _time, _size, _id, _neighbourhood_id

    $('#neighbourhood').on('click',function(event){
        _neighbourhood_id = parseInt($(this).attr('value'))
        //console.log(_neighbourhood_id)

        $.ajax({
            url: '/neighbourhood/' + _neighbourhood_id +'.json',
            method: 'GET',
            data: {},
            dataType: 'json'
        }).done(function(data){
            randomrestaurant = data[Math.floor(Math.random()*data.length)];
            _restaurant = randomrestaurant;
            //console.log(_restaurant);
            $('#neighbourhood-form').html("")
            $('#new-reservation-form').fadeIn();
        }).fail(function (jqXHR, status){
            alert('Error!')
            // notify the user that the thing has failed. i.e. alert or something
        });
    });

    $('#submit').on('click', function(event){
        event.preventDefault();
        var year = $('#reservation_date_1i').find(':selected').attr('value');
        var month = $('#reservation_date_2i').find(':selected').attr('value');
        var day = $('#reservation_date_3i').find(':selected').attr('value');
        _date = Date(year + '-' + month + '-' + day)
        // "Tue Sep 20 - 11" format of json

        _time = Number($('#reservation_time_4i').find(':selected').attr('value'));
        _size = Number($('#reservation_size').find(':selected').attr('value'));
        _id = Number($('.user_id').attr('value'))
        console.log("restaurant id: " + _restaurant.id)
        console.log("neighbourhood id: " + _neighbourhood_id)
        console.log("date: " + _date)
        console.log("Party size: " +_size)
        console.log("user id:" +_id)
        console.log("time:" + _time)

        $('#new-reservation-form').html("");
        $('#conformation-form').fadeIn();
        $('<div>').attr('class', 'name').html("Name: " + _restaurant.name).appendTo('#conformation-details')
        $('<div>').attr('class', 'name').html("Address: " +_restaurant.address).appendTo('#conformation-details')
        $('<div>').attr('class', 'name').html("Date: "+ _restaurant.description).appendTo('#conformation-details')
    });

    $('#conformation').on('click', function(event){

        var reservation = { reservation: 
            {time: _time, 
            date: _date, 
            size: _size, 
            neighbourhood_id: _neighbourhood_id, 
            restaurant_id: _restaurant.id}}
        console.log(reservation);

        $.ajax({
            url: '/reservations',
            type: 'POST',
            data: reservation,
            dataType: "json"
        }).done(function(info){
            window.location.replace("/reservations");
        }).fail(function(jqXHR, status){
            console.log(status);
        });
    });


});
//for data we could use $(this).serialize()
// $.ajax({
//   type: "POST",
//   url: url,
//   data: data,
//   success: success,
//   dataType: dataType
// });





