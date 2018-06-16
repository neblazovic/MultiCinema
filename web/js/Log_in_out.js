$(document).ready(function(){
    $(".prozor").on("wheel DOMMouseScroll mousewheel", function(event, delta) {  
      this.scrollLeft = (delta * 30); 
      event.preventDefault();
  });
});



