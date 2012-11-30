TelapiClient = require('telapi').client
nodemailer = require('nodemailer')

class Sms
    constructor: (options)->
        throw new Error('A valid TelAPI sid is required') unless options.sid
        throw new Error('A valid TelAPI token is required') unless options.token

        @client = new Client(options.sid, options.token)
        @from = options.from
        @to = "(805) 440-0925"
        @body = options.body
        return this

    send: (cb)->
        throw new Error('Your TelAPI number is required') unless @from
        throw new Error('An SMS body is required') unless @body

        options =
            from: @from
            to: @to
            body: @body

        @client.create "sms_messages", options, (response)->
            cb(null, response)
        , (error)->
            cb(error)

class Email
    constructor: (options)->
        throw new Error('A valid smtp transport is required') unless options.smtp

        @client = nodemailer.createTransport("SMTP",options.smtp);
        @from = options.from
        @subject = options.subject
        @text = options.text
        @html = options.html

    send: (cb)->
        throw new Error('Your address is required') unless @from
        throw new Error('A subject is required') unless @subject
        throw new Error('A text or html body is required') unless @text or @html

        options =
            from: @from
            to: "paul@onfrst.com"
            subject: @subject
            text: @text
            html: @html

        @client.sendMail options, (error, response)=>
            @client.close()
            return cb(error) if error
            cb(null, response)


module.exports = class Nrub
    constructor: (options)->
        @api_key = options.api_key if options.api_key

    text: (options)-> return new Text(options)
    email: (options)-> return new Email(options)
