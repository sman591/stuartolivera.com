$(document).ready ->

  # Social Link Mouse Hovers

  $('a').mouseHovers()

  # Fancy That Center

  fancy_that_center('init')

  # Responsive Text Sizes

  $('.main h1').fitText(0.7, { maxFontSize: '100px' })
  $('.main h2').fitText(1.7, { maxFontSize: '42px' })
  $('.panels > div').fitText(2.2, { maxFontSize: '18px', minFontSize: '12px' })

  # Contact Form

  $('form').ajaxForm
    beforeSubmit: disableSubmits
    success:      enableSubmits
    resetForm:    true
    timeout:      1000

$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name] isnt `undefined`
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""

  o

fancy_that_center = ->

  if (arguments[0] == 'init')
    $(window).resize(fancy_that_center)

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

    top    = Math.max 0, (($(window).height() - $(this).height()) / 2)  - 50
    bottom = Math.max 0, $(window).height() - $(this).height() - top - 50

    this.css("padding-top", top + "px")
    this.css("padding-bottom", bottom + "px")
    return this

disableSubmits = (formData, jqForm, options) ->
  $(jqForm).find('.error').removeClass('error')
  $(jqForm).find('.response').remove()

  $(jqForm).find('button[type=submit], input[type=submit]').each ->
    $(this).data('original-text', $(this).text())
    $(this).attr("disabled", "disabled").text('Please Wait...')

  error = false
  emailFilter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

  if $(jqForm).find('input[name="name"]').val().trim().length == 0
    $(jqForm).find('input[name="name"]').parents('.control-group').addClass('error')
    error = true
  if !emailFilter.test($(jqForm).find('input[name="email"]').val())
    $(jqForm).find('input[name="email"]').parents('.control-group').addClass('error')
    error = true
  if $(jqForm).find('select[name="subject"]')[0].selectedIndex <= 0
    $(jqForm).find('select[name="subject"]').parents('.control-group').addClass('error')
    error = true
  if $(jqForm).find('textarea[name="comments"]').val().trim().length == 0
    $(jqForm).find('textarea[name="comments"]').parents('.control-group').addClass('error')
    error = true

  if error
    $(jqForm).find('button[type=submit], input[type=submit]').each ->
      $(this).removeAttr("disabled").text($(this).data('original-text')).after('<span class="response"><span class="label label-important">Please fill in the required fields</span></span>')
    $(jqForm).find('.response').fadeIn(300)
    return false

enableSubmits = (responseText, statusText, xhr, $form) ->
  $form.find('button[type=submit], input[type=submit]').each ->
    $(this).removeAttr("disabled").text($(this).data('original-text')).after('<span class="response"><span class="label label-success">Sent, thank you!</span></span>')
  $form.find('.response').fadeIn(300)
