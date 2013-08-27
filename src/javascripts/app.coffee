$(document).ready ->

  # Social Link Mouse Hovers

  $('a').mouseHovers()

  # Fancy That Center

  fancy_that_center('init')

  # Responsive Text Sizes

  $('.main h1').fitText(0.7, { maxFontSize: '100px' })
  $('.main h2').fitText(1.7, { maxFontSize: '42px' })
  $('.panels > div p').fitText(2.2, { maxFontSize: '18px' })

fancy_that_center = ->

  if (arguments[0] == 'init')
    $(window).resize(fancy_that_center)

  # $('.panels > .about').centerVertically()
  $('.panels > div').each ->
    $(this).centerVertically()
  $('.main .content').centerVertically()

jQuery.fn.mouseHovers = ->
  $(this).hover ->
    $(this).clearQueue().animate
      opacity: 0.6 if $(this).css('background-image') != ''
    , 70
  , ->
    $(this).animate
      opacity: 1
    , 200

jQuery.fn.centerVertically = ->
    padding_top = Math.max(0, (($(window).height() - $(this).height()) / 2)  - 50)
    padding_bottom = Math.max(0, $(window).height() - $(this).height() - padding_top - $(window).scrollTop() - 50)

    console.log padding_top

    this.css("padding-top", padding_top + "px")
    this.css("padding-bottom", padding_bottom + "px")
    return this