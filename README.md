## Registering for an API key

## Basic Usage

    var nrub = new require("nrub")({
      api_key: "<insert-api-key-here>"
    })

### Sending email

    var email = nrub.email({
      subject: "Hello",
      body: "Message body..."
    });

    email.send(function (err, response) {
      ...
    });

### Sending a text message

    var sms = nrub.sms({
      body: "Text body..."
    });
    
    sms.send(function (err, response) {
      ...
    });

