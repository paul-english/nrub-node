assert = require('assert')
config = require('config')
Nrub = require('../src/index')

describe "Depending on nrub", ->
    describe "sending email", ->
        it "require smtp settings", ->
            assert.throws ->
                nrub = new Nrub({})
                nrub.email({
                    subject: "Help!"
                    body: "I need help!!!"
                }).send()
