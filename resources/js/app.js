$().ready(function() {

	/* Social Link Mouse Hovers */

	$('.social > a').mouseHovers()

	/* Center Content */

	$('.main').center()
	$('.panels > div').centerVertically()

	/* Responsive Text Sizes */

	$('.main h1').fitText(0.7, { maxFontSize: '100px' })
	$('.main h2').fitText(1.7, { maxFontSize: '42px' })
	$('.panels > div p').fitText(2.5, { maxFontSize: '18px' })

	/* Page Hash Controller */

	init_hash_controller()

})

$(window).hashchange(function(){
	update_panels()
})

$(window).resize(function() {
	$('.panels > div').centerVertically()
	$('.main .content').css("margin-top", Math.max(0, (($(window).height() - $(inside).outerHeight()) / 2) + 
                                                $(window).scrollTop()-50) + "px");
})
jQuery.fn.mouseHovers = function () {
	$(this).hover(function() {
		$(this).clearQueue().animate({
			opacity: 0.6
		}, 100)
	}, function() {
		$(this).animate({
			opacity: 1
		}, 200)
	});
}


jQuery.fn.center = function (callback) {
    this.css("position","absolute");

    inside = this.find('.content');

    inside.css("margin-top", Math.max(0, (($(window).height() - $(inside).outerHeight()) / 2) + 
                                                $(window).scrollTop()-50) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");

    return this;
}

jQuery.fn.centerVertically = function () {
    this.css("margin-top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
                                                $(window).scrollTop()-50) + "px");
    return this;
}


jQuery.fn.introduce = function(act) {

	if (act == 'affix') {

		$('.main').animate({
			left: 0
		}, 500)

	}
	else {

		this.hide()

		content = this.find('.content')

		$('body').css('overflow', 'hidden')
		margin_top = content.css('margin-top');
		content.css('margin-top', $(window).height());

		this.fadeIn(1000)

		that = this

		content.animate({
			'margin-top' : margin_top,
			'opacity' : 1
		}, 1200)

		return this;

	}

}

reset_panels = function() {

	$('.panels > div:visible').animate({
		opacity: 0,
		left: $(window).width()
	}, 800)

	$('.stripes').animate({
		opacity: 0,
		top: $(window).height()
	})

}

init_hash_controller = function() {

	window.lastHash = '';

	update_panels();

}

update_panels = function() {

	hash = window.location.hash

	$('body').css('overflow', 'hidden')

	if (hash !== '' && hash !== '#home') {
		$('.main').introduce('affix')
	}

	switch (hash) {

		case '#about':

			$('.stripes').animate({
				opacity: 1,
				top: 0
			}, 1500)

			$('.panels .about').delay(500).animate({
				left: ($(window).width() / 2),
				opacity: 1
			}, 1500)

		break;

		default:

			reset_panels();

			$('.main').introduce();

		break;

	}

	window.lastHash = hash;

}