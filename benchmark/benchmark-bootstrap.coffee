{$$} = require 'space-pen'
nakedLoad 'jasmine'
nakedLoad 'jasmine-atom-reporter'
nakedLoad 'jasmine-focused'

$ = require 'jquery'

document.title = "Benchmark Suite"

$('head').append $$ ->
  @link rel: "stylesheet", type: "text/css", href: "static/jasmine.css"

$('body').append $$ ->
  @div id: 'jasmine-content'

jasmineEnv = jasmine.getEnv()
atomReporter = new jasmine.AtomReporter(document, false)

jasmineEnv.addReporter(atomReporter)

jasmineEnv.specFilter = (spec) -> atomReporter.specFilter(spec)

require 'benchmark-suite'
jasmineEnv.execute()