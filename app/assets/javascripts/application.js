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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

$(function() {
  $("#start_date, #end_date").datepicker({ dateFormat: "dd/mm/yy" });

  // $("i").on('click', function() {
  //   $("#start_date").datepicker();
  // )};

// $(".date-picker").datepicker({
//     showOn: "button",
//     buttonImage: "calendar-icon.jpg"
// });

$(".date-picker").datepicker();

//   $(".date-picker").datepicker();
//   $(".datepicker-trigger").on("click", function() {
//     $(".date-picker").datepicker("show");
// });

  // $("i").on("click", function() {
  //   alert("Hello world");
  // });

  $("#start_date, #end_date").on("change", function() {
    var date = parseDate($(this).val());
    (isValid(date)) ? resetFormat(this).val(formatDate(date)) : formatError(this);
  });

  $("#start_date, #end_date").on("focus", function() {
    var date = parseDate($(this).val());
    if (!isValid(date)) resetFormat(this).val("");
  });

  $("#clear_date_filters").on("click", function() {
    $("#start_date, #end_date").each(function() {
      resetFormat(this).val("");
    });
  });

  function parseDate(date) {
    var date = date.split(/[\/\-\,\.]/);
    return new Date(date[1] + "/" + date[0] + "/" + date[2]);
  }

  function isValid(date) {
    return !isNaN(date);
  }

  function formatDate(date) {
    return date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
  }

  function resetFormat(selector) {
    $("label[for='" + selector.id + "']").text(selector.id.replace('_', ' ') +": ").css('color', 'black');
    $(selector).css({ 'background-color': 'white' });
    return $(selector);
  }

  function formatError(selector) {
    $("label[for='" + selector.id + "']").text("invalid " + selector.id.replace('_', ' ') +": ").css('color', 'red');
    $(selector).val("").css({ 'background-color': '#faa' });
  }
});

// Table row link logic
$("tr[data-link]").click(function() { window.location = this.dataset.link })
