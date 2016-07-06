$(document).ready(function() {
   
    /* ======= Scrollspy ======= */
    $('body').scrollspy({ target: '#header', offset: 100});
    
    /* ======= ScrollTo ======= */
    $('a.scrollto').on('click', function(e){
        
        //store hash
        var target = this.hash;
                
        e.preventDefault();
        
		$('body').scrollTo(target, 800, {offset: -60, 'axis':'y'});
        //Collapse mobile menu after clicking
		if ($('.navbar-collapse').hasClass('in')){
			$('.navbar-collapse').removeClass('in').addClass('collapse');
		}
		
	}); 
	
	/* ======= Fixed Header animation ======= */ 
        
    
	
	/* ======= Vegas Plugin ======= */
    /* Ref: http://vegas.jaysalvat.com/index.html */
    $('#promo').vegas({
        delay: 8000,
        overlay: 'static/assets/plugins/vegas/dist/overlays/06.png',
        color: '#101113',
        transition: 'zoomOut',
        transitionDuration: 3000,
        slides: [
            { src: 'static/assets/images/hero/hero-1.jpg' },
            { src: 'static/assets/images/hero/hero-2.jpg' },
            { src: 'static/assets/images/hero/hero-3.jpg' },
            { src: 'static/assets/images/hero/hero-4.jpg' },
            { src: 'static/assets/images/hero/hero-5.jpg' },
            { src: 'static/assets/images/hero/hero-6.jpg' },
            { src: 'static/assets/images/hero/hero-7.jpg' },
            { src: 'static/assets/images/hero/hero-8.jpg' }
        ]
    });
    
    /* ======= Countdown ========= */
	// set the date we're counting down to
    

    
    /* ======= Play/Stop YouTube Video in Bootstrpa Modal ======= */

    $('#video-play-triggger').on('click', function() {
        
        var theModal = $(this).data("target");
        var theVideo = $(theModal + ' iframe').attr('src');
        var theVideoAuto = theVideo + "&autoplay=1";
        
        $(theModal).on('shown.bs.modal', function () {
            $(theModal + ' iframe').attr('src', theVideoAuto);
        });
        
        $(theModal).on('hide.bs.modal', function () {
            $(theModal + ' iframe').attr('src', '');
        });
        
        $(theModal).on('hidden.bs.modal', function () {
            $(theModal + ' iframe').attr('src', theVideo);
        });
 
    });

});