var sendEventToAPI = function(name, property1, property2, email, token){
    var _event = {
        name: name,
        property1: property1,
        property2: property2
    }

    var _request = $.ajax({
      type: "POST",
      dataType: "json",
      url: "http://localhost:3001/events",
      data: {event: _event},
      crossDomain: true,
      xhrFields: {withCredentials: true},
      headers: {
        'X-API-EMAIL': email,
        'X-API-TOKEN': token
      }
    })
}