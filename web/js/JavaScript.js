    document.addEventListener("load",function(){
   //    dodaj_event_listener_login();
    });
    activate();
    var natpis= document.getElementById("natpis");
    var natpis_prodavac= document.getElementById("natpis_prodavac");    
    var natpis_korisnik= document.getElementById("natpis_korisnik");      
    var natpis_rezervacija= document.getElementById("natpis_rezervacija");
    var stil=document.createElement("style");
    var stil_on_Hover=document.createTextNode("\n\
        #hover_menu,#hover_menu_prodavac,#hover_menu_korisnik,#hover_menu_rezervacija{\n\
            background-color:#231F20;\n\
            margin-right :1px;\n\
            width:300px;\n\
            float:right;\n\
        }\n\
        .hover_menu_item{\n\
            width: 73px;\n\
            height:35px;\n\
            float: left;\n\
            margin-left: 6px;\n\
            margin-top: 6px;\n\
            border-top-style:solid;\n\
            border-bottom-style:solid;\n\
            border-top-color:lightslategray;\n\
            border-bottom-color:lightslategray;\n\
            background-color: #231F20;\n\
            display:block;\n\
        }\n\
        .hover_menu_item:hover{\n\
            background-color: #C11437;\n\
        }\n\
        ._link, #kriterijum{\n\
            display:block;\n\
            font-size: 11px;\n\
            font-family: 'Armata';\n\
            color:white;\n\
            margin-left:auto;\n\
            margin-right:auto;\n\
        }\n\
        #film{\n\
            width:40px;\n\
            margin-left:22px;\n\
        }\n\
        #bioskop{\n\
            width:70px;\n\
            margin-left:13px;\n\
        }\n\
        #datum{\n\
            width:50px;\n\
            margin-left:17px;\n\
        }\n\
        #tehnologija{\n\
            width:75px;\n\
            margin-left:12px;\n\
        }\n\
        #natpis,#natpis_prodavac,#natpis_korisnik,#natpis_rezervacija{\n\
            display:none;\n\
        }"
    );
    var stil_on_load = document.createTextNode("\n\
        ._link, #kriterijum,.hover_menu_item{\n\
            display:none;\n\
        }\n\
         #hover_menu,#hover_menu_prodavac,#hover_menu_korisnik,#hover_menu_rezervacija{\n\
            margin-left:1px;\n\
            width:320px;\n\
            background-color:#231F20;\n\
        }\n\
        }"
        );   
function hover_menu_enter() {
  stil.appendChild(stil_on_Hover);
  document.head.appendChild(stil);  
    $('.wrapper >*').css({
    'display': 'block'
  });
}
function hover_menu_enter_korisnik() {
  stil.appendChild(stil_on_Hover);
  document.head.appendChild(stil);
  $('#slider1').css({
    'display': 'none'
  });
}
function hover_menu_enter_rezervacija() {
  stil.appendChild(stil_on_Hover);
  document.head.appendChild(stil);
  $('#slider1').css({
    'display': 'none'
  });
  
    $('.wrapper >*').css({
    'display': 'block'
  });
}
function loading() {
  stil.appendChild(stil_on_load);
  document.head.appendChild(stil);
}
function hover_menu_leave() {
  stil.appendChild(stil_on_load);
  stil.removeChild(stil_on_Hover);
  document.head.appendChild(stil);
}
function activate() {
  activate_hover_menu();
  activate_hover_menu_prodavac();
  activate_hover_menu_korisnik();
  activate_hover_menu_rezervacija();
 // dodaj_event_listener_login();
}
function activate_hover_menu() {
  var hover_menu = document.getElementById('hover_menu');
  if (hover_menu) {
    hover_menu.addEventListener('mouseenter', hover_menu_enter, false);
    hover_menu.addEventListener('mouseleave', hover_menu_leave, false);
  } 
  else document.addEventListener('DOMContentLoaded', activate_hover_menu, false);
}
function activate_hover_menu_prodavac() {
  var hover_menu = document.getElementById('hover_menu_prodavac');
  if (hover_menu) {
    hover_menu.addEventListener('mouseenter', hover_menu_enter, false);
    hover_menu.addEventListener('mouseleave', hover_menu_leave, false);
  } 
  else document.addEventListener('DOMContentLoaded', activate_hover_menu_prodavac, false);
}
function activate_hover_menu_korisnik() {
  var hover_menu = document.getElementById('hover_menu_korisnik');
  if (hover_menu) {
    hover_menu.addEventListener('mouseenter', hover_menu_enter_korisnik, false);
    hover_menu.addEventListener('mouseleave', hover_menu_leave, false);
  } 
  else document.addEventListener('DOMContentLoaded', activate_hover_menu_korisnik, false);
}
function activate_hover_menu_rezervacija() {
  var hover_menu = document.getElementById('hover_menu_rezervacija');
  if (hover_menu) {
    hover_menu.addEventListener('mouseenter', hover_menu_enter_rezervacija, false);
    hover_menu.addEventListener('mouseleave', hover_menu_leave, false);
  } 
  else document.addEventListener('DOMContentLoaded', activate_hover_menu_rezervacija, false);
}

function log_in() {
  var forma = document.getElementById('login_forma_korisnik');

  forma.style.display = 'block';
}
function prikazi_formu() {
  var pozadina = document.getElementById('login_pozadina');
  var forma = document.getElementById('login_forma');
  pozadina.style.display = 'none';
  forma.style.display = 'block';
}
function dodaj_event_listener_login() {
  var login = document.getElementById('log_out_div_i');
  login.addEventListener('click', function () {
    prikazi_formu();
  });
}

function validateForm() {
  var x = document.forms['login_f']['username'].value;
  var y = document.forms['login_f']['password'].value;
  if (x === '' || y === '') {
    alert('Oba podatka moraju biti uneta!');
    return false;
  }
  log_in();
}                                // validacija login forme
    $(document).ready(function () {
  $('.poster').on('click', function (event) {
    $('.player iframe').css({
      'display': 'block'
    });
    event.preventDefault();
    $('.player iframe').prop('src', $(event.currentTarget).parent('a').attr('href'));
    $('.player_wrapper').css({
      'display': 'block'
    });
  });
  $('.close').on('click', function () {
    $('.player').html('');
    $('.player_wrapper').css({
      'display': 'none'
    });
    location.reload();
  });
});                     // otvaranje trejlera
                              
$(document).ready(function () {
  $('.hover_menu_item').on('click', function () {
    var user = $('#sesija').data('user');
    if (!user) {
      alert('Morate se prijaviti da bi mogli da rezervisete karte!');
    }
  });
});                      //obavezno prijavljivanje pre rezervacije
function vrati(event) {
  $('#slider1').css({
    'display': 'block'
  });
  event.preventDefault();
}                                  //skrivanje login forme posle prijave

function film_div() {
  $(document).ready(function () {
    $('.filmskaTraka').prependTo($('.traka'));
  });
}

function datum_div() {
  $(document).ready(function () {
      
    $('.div_horizontal_pro').prependTo($('.traka'));
  });
}
function bioskop_div() {
  $(document).ready(function () {
    $('.div_horizontal').prependTo($('.traka'));
     $('.div_horizontal_pro').css({"display":"none"});
      $('.div_horizontal_teh').css({"display":"none"});
  });
}
function tehnika_div() {
  $(document).ready(function () {
    $('.div_horizontal_teh').prependTo($('.traka'));
  });
}
$(document).ready(function () {
  $('.poster_traka').on('click', function (e) {
    $(this).find('.poster_traka');
    e.stopPropagation();
    $('#izabraniFilm').val('');
    $('#izabraniFilm').val(this.alt);
    var id = this.id;
    $('#idFilma').val(id);
  });
  $('.slikaBioskopa').on('click', function (event) {
    $('#izabraniBioskop').val('');
    $('#izabraniBioskop').val(event.target.alt);
    $('#idBioskopa').val(event.target.id);
  });
  $('.div_vertical_pro input').on('click', function (event) {
    $('#izabraniDatum').val('');
    $('#izabraniDatum').val(event.target.value);
    var unos = event.target;
    $('#idDatuma').val(unos.id);
    $('#salaHid').val(unos.attr('data-sala'));
  });
  $('.div_vertical_teh').on('click', function (event) {
    $('#izabranaTehnologija').val('');
    $('#izabranaTehnologija').val(event.target.alt);
    $('#idTehnologije').val(event.target.id);
  });
  $('#resetovanje').on('click', function () {
    $('#izabraniFilm, #izabraniBioskop, #izabraniDatum, #izabranaTehnologija').val('');
  });
  $('#odustajanje').on('click', function (event) {
    $('#slider1').css({
      'display': 'block'
    });
    event.preventDefault();
  });
});
$(document).ready(function () {
  $('#potvrda').on('click', function () {
    hover_menu_enter_korisnik();
    $('#slider1').css({
      'display': 'none'
    });
    $('#klik_bioskop').trigger('click');
    bioskop_div();
  });
});

$(document).ready(function () {
  $('input[name=\'check\']').on('change', function () {
    $('textarea[name=\'izborMesta\']').val($('input[name=\'check\']').filter(':checked').map(function () {
      return $(this).attr('data-brojSedista');
    }).get().join(', ')
    );
    var checked = $(this).prop('checked');
    if (checked) {
      $(this).attr('data-odabrano', 1);
    } else {
      $(this).attr('data-odabrano', 0);
    }
    if ($('textarea[name=\'izborMesta\']').val() !== '') {
      $('#nastavak').val('Rezervisi').css({
        'border-color': 'red',
        'border-style': 'solid',
        'border-width': '1px'
      });
    }
  });
});//Unos broja sedista u  textarea
function goBack() {
  window.history.back();
}                   //povratak na prethodnu stranicu
$(document).ready(function () {
  $('input[data-city=\'zauzeto\']').next('label').addClass('zauzeto');
});
$('.sediste input').each(function () {
  var $element = $(this);
  if ($element.attr('data-zauzeto') === '1') {
    var $label = $('label[for=\'' + this.id + '\']');
    $label.addClass('zauzeto');
    $element.prop({
      'disabled': true
    });
  }
  if ($element.attr('data-invalidsko') === '1') {
    var $label = $('label[for=\'' + this.id + '\']');
    $label.addClass('invalidsko');
    $element.prop({
      'disabled': true
    });
  }
});// disable zauzetih i invalidskih mesta
$(document).ready(function () {
  $('#dalje').on('click', function () {
    $(this).css({
      'display': 'none'
    });
    $('#nastavak').css({
      'display': 'block'
    });
    prikazi_Formu();
  });//sledeci korak filtriranja filmova za rezervaciju
  
  $("#main_film, #footer_film").parent().on("click",function(event){
      $(".prozor.reper").load("Filmovi.jsp .reper ");
      $(".prozor.uskoro").css({"display":"block"});
      $("#uskoro").css({"display":"block"});
      $(".prozor.uskoro").load("Filmovi.jsp .uskoro >*");
      $("#repertoar").html("REPERTOAR");
      $(".pozadina_gradient1").css({"height":"130px"});
      $(".pozadina_gradient").css({"height":"1434px"});
      event.preventDefault();
  });//prikaz info o filmovima

  $("#main_bioskop, #footer_bioskop").parent().on("click",function(event){
      $(".prozor.reper").load("Bioskopi.jsp .podaciOBioskopima >* ");
      $(".prozor.uskoro").css({"display":"none"});
      $("#repertoar").html("BIOSKOPI");
      $("#uskoro").css({"display":"none"});
      $(".maska").css({"height":"692px"});
      $(".pozadina_gradient").css({"height":"1162px"});
      event.preventDefault();
  });//prikaz info o bioskopima
});
  $("#main_klub, #footer_klub").parent().on("click",function(event){
      $(".prozor.reper").load("klubovi.jsp .podaciOKlubovima >* ");
      $(".prozor.uskoro").css({"display":"none"});
      $("#repertoar").html("Klubovi");
      $("#uskoro").css({"display":"none"});
      event.preventDefault();
  });//prikaz info o bioskopima
  $("#login_pozadina_korisnik").on("click",function(){
      $(".prozor.reper").load("klubovi.jsp .podaciOKlubovima >* ");
      $(".prozor.uskoro").css({"display":"none"});
      $("#repertoar").html("Klubovi");
      $("#uskoro").css({"display":"none"});
  });
$(document).ready(function () {
    $("#log_out_div_i").on("click",function(event){
        event.preventDefault();
        prikazi_formu();
    });

$("#main_home").parent().on("click",function(){
     $(".prozor.reper").load("index.jsp .prozor.reper >* ");
     $(".prozor.uskoro").load("index.jsp .prozor.uskoro >* ");
      $(".pozadina_gradient1").css({"height":"130px"});
      $(".pozadina_gradient").css({"height":"1434px"});
});
$("#main_home_kor").parent().on("click",function(){
     $(".prozor.reper").load("Korisnik.jsp .prozor.reper >* ");
     $(".prozor.uskoro").load("Korisnik.jsp .prozor.uskoro >* ");
      $(".pozadina_gradient1").css({"height":"130px"});
      $(".pozadina_gradient").css({"height":"1434px"});
});
$("#registracija").parent().on("click",function(){    
      $(".pozadina_gradient1").css({"height":"auto"});
});

});
$(document).ready(function(){
    $(".username").on("click",function(){
       
        
    });
});