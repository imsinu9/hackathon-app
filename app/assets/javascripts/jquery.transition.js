// windows.addEventListner('load',height);
// function height()
// {
// 	var h = window.innerHeight;
// 	document.getElementById('view0').style.height = h+"px";
//     document.getElementById('view1').style.height = h+"px";
//     document.getElementById('view2').style.height = h+"px";
// }
// google.maps.event.addDomListener(window, 'load', initialize);



// var pContainerHeight = $('#view0').height();

// $(window).scroll(function(){

//   var wScroll = $(this).scrollTop();

//   if (wScroll <= pContainerHeight) {

//     $('.logo').css({
//       'transform' : 'translate(0px, '+ wScroll /2 +'%)'
//     });

//     $('.back-bird').css({
//       'transform' : 'translate(0px, '+ wScroll /4 +'%)'
//     });

//     $('.fore-bird').css({
//       'transform' : 'translate(0px, -'+ wScroll /40 +'%)'
//     });

//   }


//   // Landing Elements
//   if(wScroll > $('.clothes-pics').offset().top - ($(window).height() / 1.2)) {

//     $('.clothes-pics figure').each(function(i){

//       setTimeout(function(){
//         $('.clothes-pics figure').eq(i).addClass('is-showing');
//       }, (700 * (Math.exp(i * 0.14))) - 700);
//     });

//   }


//   // Promoscope
//   if(wScroll > $('.large-window').offset().top - $(window).height()){

//     $('.large-window').css({'background-position':'center '+ (wScroll - $('.large-window').offset().top) +'px'});

//     var opacity = (wScroll - $('.large-window').offset().top + 400) / (wScroll / 5);

//     $('.window-tint').css({'opacity': opacity});

//   }


//   // Floating Elements

//   if(wScroll > $('.blog-posts').offset().top - $(window).height()){

//     var offset = (Math.min(0, wScroll - $('.blog-posts').offset().top +$(window).height() - 350)).toFixed();

//     $('.post-1').css({'transform': 'translate('+ offset +'px, '+ Math.abs(offset * 0.2) +'px)'});

//     $('.post-3').css({'transform': 'translate('+ Math.abs(offset) +'px, '+ Math.abs(offset * 0.2) +'px)'});

//   }
// });


// // Map functions
// function initialize() {
//     var mapOptions = {
//         center: new google.maps.LatLng(28.1823294, -82.352912),
//         zoom: 9,
//         mapTypeId: google.maps.MapTypeId.HYBRID,
//         scrollwheel: false,
//         draggable: false,
//         panControl: true,
//         zoomControl: true,
//         mapTypeControl: true,
//         scaleControl: true,
//         streetViewControl: true,
//         overviewMapControl: true,
//         rotateControl: true,
//     };
//     var map = new google.maps.Map($("#map-canvas"), mapOptions);
// }
// google.maps.event.addDomListener(window, 'load', initialize);
