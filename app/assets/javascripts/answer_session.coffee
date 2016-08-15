# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/







$(document).ready ->
	#jQuery time
	current_fs = undefined
	next_fs = undefined
	previous_fs = undefined
	
	#fieldsets
	left = undefined
	opacity = undefined
	scale = undefined
	
	#fieldset properties which we will animate
	animating = undefined
	
	#flag to prevent quick multi-click glitches
	$('.next').click ->
	  if animating
	    return false
	  animating = true
	  current_fs = $(this).parent()
	  next_fs = $(this).parent().next()
	  #activate next step on progressbar using the index of next_fs
	  $('#progressbar li').eq($('fieldset').index(next_fs)).addClass 'active'
	  #show the next fieldset
	  next_fs.show()
	  #hide the current fieldset with style
	  current_fs.animate { opacity: 0 },
	    step: (now, mx) ->
	      
	      #as the opacity of current_fs reduces to 0 - stored in "now"
	      #1. scale current_fs down to 80%
	      scale = 1 - ((1 - now) * 0.2)
	      
	      #2. bring next_fs from the right(50%)
	      left = now * 50 + '%'
	      
	      #3. increase opacity of next_fs to 1 as it moves in
	      opacity = 1 - now
	      current_fs.css 'transform': 'scale(' + scale + ')'
	      next_fs.css
	        'left': left
	        'opacity': opacity
	      return
	    duration: 800
	    complete: ->
	      current_fs.hide()
	      animating = false
	      return
	    easing: 'easeInOutBack'
	  return
	
	$('.previous').click ->
	  if animating
	    return false
	  animating = true
	  current_fs = $(this).parent()
	  previous_fs = $(this).parent().prev()
	  
	  #de-activate current step on progressbar
	  $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass 'active'
	  
	  #show the previous fieldset
	  previous_fs.show()
	  
	  #hide the current fieldset with style
	  current_fs.animate { opacity: 0 },
	    step: (now, mx) ->
	      
	      #as the opacity of current_fs reduces to 0 - stored in "now"
	      #1. scale previous_fs from 80% to 100%
	      scale = 0.8 + (1 - now) * 0.2
	      
	      #2. take current_fs to the right(50%) - from 0%
	      left = (1 - now) * 50 + '%'
	      
	      #3. increase opacity of previous_fs to 1 as it moves in
	      opacity = 1 - now
	      current_fs.css 'left': left
	      previous_fs.css
	        'transform': 'scale(' + scale + ')'
	        'opacity': opacity
	      return
	    duration: 800
	    complete: ->
	      current_fs.hide()
	      animating = false
	      return
	    easing: 'easeInOutBack'
	  return
	  


	$('form').submit (e) ->
		$unchecked = $ 'div.form-group:not(:has(:radio:checked))'
		questionlist = ""
		$unchecked.each ->
			questionlist = questionlist + '     ' + $(this).attr('data-question-label') + '\n'
			return					
		if $unchecked.length
			alert 'You didn\'t answer the following questions:　\n' + questionlist
			e.preventDefault()

return
