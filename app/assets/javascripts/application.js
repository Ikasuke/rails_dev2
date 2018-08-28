// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require moment                                     # datetimepickerに必要
//= require moment/ja                                  # datetimepickerに必要
//= require bootstrap-datetimepicker                   # datetimepickerに必要
//= require turbolinks
//= require_tree ./main


var data = {'data-date-format': 'YYYY-MM-DD' };
$(function(){
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker();
});
