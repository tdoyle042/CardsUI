cards_global =
	card_container : null
	card_width: 250


$(document).ready ->
	console.log "Page Ready"
	
	cards = []

	$(".card").each (card_elem) ->
		card = new Card card_elem, "Llama", "http://twistedrootburgerco.com/wp-content/uploads/Llama.jpg"
		cards.push card

	cards_global = new CardContainer $(".card-container"), cards
	console.log cards.length
	return;

class Card
	constructor: (@elem, @title, @imageURL) ->

	render: ->
		return

class CardContainer
	constructor: (@elem, @cards) ->

	setContainerWidth: ->
		width = @cards.length * 251
		@elem.width width
		return

