# Globals
cards_global =
	card_container : null
	card_width: 250

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

scrollHandler = (event) ->
	console.log "Document was scroll"
	oldLeftMargin = parseInt ($(".card-container").first().css "margin-left"), 10
	console.log oldLeftMargin
	console.log typeof oldLeftMargin
	$(".card-container").first().css "margin-left", oldLeftMargin - 5 + "px"
	return

$(document).ready ->
	console.log "Page Ready"
	
	cards = []

	$(".card").each (card_elem) ->
		card = new Card card_elem, "Llama", "http://twistedrootburgerco.com/wp-content/uploads/Llama.jpg"
		cards.push card

	cards_global.card_container = new CardContainer $(".card-container"), cards
	cards_global.card_container.setContainerWidth()

	window.addEventListener "mousewheel", scrollHandler
	return



