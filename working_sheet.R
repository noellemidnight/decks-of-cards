# imports deck from csv
aces_low_deck <- read.csv("cards.csv")

# deals the top card of the deck
deal <- function(aces_low_deck) {
  aces_low_deck[1, ]
}

# shuffles the deck
shuffle <- function(aces_low_deck) {
  random <- sample(1:52, size = 52)
  aces_low_deck[random, ]
}

# creates a new shuffled deck
al_deck_shuffled <- shuffle(aces_low_deck)

# deals from a shuffled deck
deal(al_deck_shuffled)

# a deck for the game of War
# aces are high
# the bracketed statement provides an index for the replacement, so that only aces get their value changed
war_deck <- shuffle(aces_low_deck)
war_deck$value[war_deck$face == "ace"] <- 14

# a deck for the game of Hearts
# all values are 0
hearts_deck <- aces_low_deck
hearts_deck$value <- 0

# except hearts, which are worth 1
hearts_deck$value[hearts_deck$suit == "hearts"] <- 1

# and the Q of Spades, worth 13
queen_of_spades <- hearts_deck$face == "queen" & hearts_deck$suit == "spades"

hearts_deck$value[queen_of_spades] <- 13

# a deck for the game of Blackjack
# face cards are worth 10
# aces are worth 11 or 1

blackjack_deck <- aces_low_deck
facecard <- blackjack_deck$face %in% c("king", "queen", "jack")
blackjack_deck$value[facecard] <- 10

#7.0.3