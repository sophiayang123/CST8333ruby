// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Add DataTables jQuery plugin
window.jQuery = window.$ = require('jquery');

// Load datatables styles
import 'datatables.net';
import 'datatables.net-dt/css/jquery.dataTables.css'
// import 'datatables.net-select-dt/css/select.dataTables.css'

// use datatable module which has a search function
$(document).ready(function () { 
    console.log("123")
    $("#datatable").dataTable()
 })

