# Globals
cards_global =
	card_container : null
	card_width: 250
	scroll_speed: 0
	MAX_SPEED: 10
	is_scrolling: false
	timer_id : -1

###
	Classes and such
###

class Card
	constructor: (@elem, @title, @imageURL) ->

	render: ->
		return

class CardContainer
	constructor: (@elem, @cards) ->

	setContainerWidth: ->
		width = @cards.length * 252
		@elem.width (width + 200)
		return

###
	Set Up Application
###

scrollHandler = (scrollEvent) ->
	if not Math.abs cards_global.scroll_speed > cards_global.MAX_SPEED
		cards_global.scroll_speed += scrollEvent.deltaX / 5
		
	if not cards_global.is_scrolling
		cards_global.timer_id = setInterval(updateScroll, 500)
	
	return

updateScroll = ->
	oldLeftMargin = parseInt ($(".card-container").first().css "margin-left"), 10
	newLeftMargin = oldLeftMargin - cards_global.scroll_speed
	$(".card-container").first().css "margin-left", newLeftMargin + "px"

	# "Gravity" to slow down the scroll naturally
	if cards_global.scroll_speed > 0
		if cards_global.scroll_speed < 0.1
			cards_global.scroll_speed = 0
		else
			cards_global.scroll_speed -= 0.1
	else
		if cards_global.scroll_speed > -0.1
			cards_global.scroll_speed = 0
		else
			cards_global.scroll_speed += 0.1

	if cards_global.scroll_speed < 1 and cards_global.scroll_speed > -1
		clearInterval(cards_global.timer_id)
		cards_global.scroll_speed = 0
		cards_global.timer_id = -1
	return

$(document).ready ->

	# Create a card for each DOM Card Element
	cards = []

	$(".card").each (card_elem) ->
		card = new Card card_elem, "Llama", "http://twistedrootburgerco.com/wp-content/uploads/Llama.jpg"
		cards.push card

	cards_global.card_container = new CardContainer $(".card-container"), cards
	cards_global.card_container.setContainerWidth()

	window.addEventListener "wheel", scrollHandler
	return



