$(document).ready(function() {
  $("button").on("click", "#purple", function() {
    console.log("purple");
    $('body').css("background-color", "#c397de");
  });
  $("button").on("click", "#blue", function() {
    console.log("blue");
    $('body').css("background-color", "#bbdff0");
  });
  $("button").on("click", "#grey", function() {
    console.log("grey")
    $('body').css("background-color", "#dedce8");
  });
  $("button").on("click", "#white", function() {
    console.log("white");
    $('body').css("background-color", "#ffffff");
  });
});