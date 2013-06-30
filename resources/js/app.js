$().ready(function() {

	$('.main').center()
	$('.panels > div').centerVertically()

	$('.social > a').hover(function() {
		$(this).clearQueue().animate({
			opacity: 0.6
		}, 100)
	}, function() {
		$(this).animate({
			opacity: 1
		}, 200)
	});


	$('.main').delay(400).introduce()

})

$(window).resize(function() {
	$('.main').center()
	$('.panels > div').centerVertically()
})


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


jQuery.fn.introduce = function() {

	console.log('introduce');

	this.hide()

	content = this.find('.content')

	this.css('overflow', 'hidden')
	margin_top = content.css('margin-top');
	content.css('margin-top', $(window).height());

	this.fadeIn(1000)

	content.animate({
		'margin-top' : margin_top,
		'opacity' : 1
	}, 1200, function() {
		that.css('overflow', 'auto')
	})

	return this;
}