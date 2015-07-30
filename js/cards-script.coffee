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

scrollHandler = (scrollEvent) ->
	oldLeftMargin = parseInt ($(".card-container").first().css "margin-left"), 10
	newLeftMargin = oldLeftMargin - scrollEvent.deltaY / 5
	$(".card-container").first().css "margin-left", newLeftMargin + "px"
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



