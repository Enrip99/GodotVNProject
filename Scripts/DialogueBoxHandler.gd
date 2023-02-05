extends Control

onready var dialogueBox = get_node("DTBPanel/DialogueTextBox");
onready var fullBox = get_node("FTBPanel/FullTextBox");
var currentBox;

# Called when the node enters the scene tree for the first time.
func _ready():
	fullBox.visible_characters = 0;
	dialogueBox.visible_characters = 0;
	currentBox = fullBox; #only for initialization

func loadNext():
	#NOT FINAL; FOR TESTING:
	currentBox.visible_characters = 0;
	currentBox = dialogueBox;
	currentBox.text = "When using the RandomNumberGenerator class, you should call randomize() on the instance since it has its own seed:";

func _input(event):
	if event.is_action_pressed("TextAdvance"):
		if currentBox.visible_characters < currentBox.text.length():
			currentBox.visible_characters = currentBox.text.length();
		else:
			loadNext() #llamar a pedir siguiente texto

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if currentBox.visible_characters < currentBox.text.length():
		currentBox.visible_characters += 1;
	
