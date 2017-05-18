const_value set 2
	const SCARYCAVE1F_MIRA
	const SCARYCAVE1F_PHARMACIST
	const SCARYCAVE1F_POKEFAN_M
	const SCARYCAVE1F_SUPER_NERD
	const SCARYCAVE1F_YOUNGSTER
	const SCARYCAVE1F_LASS
	const SCARYCAVE1F_HEX_MANIAC
	const SCARYCAVE1F_POKE_BALL1
	const SCARYCAVE1F_POKE_BALL2
	const SCARYCAVE1F_POKE_BALL3
	const SCARYCAVE1F_POKE_BALL4
	const SCARYCAVE1F_POKE_BALL5

ScaryCave1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ScaryCave1FMiraScript:
	faceplayer
	checkevent EVENT_BEAT_MIRA
	iftrue .Beaten
	opentext
	writetext .ChallengeText
	yesorno
	iffalse .No
	writetext .YesText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked SCARYCAVE1F_MIRA
	loadtrainer MIRA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MIRA
.Beaten
	opentext
	writetext .ItemText
	buttonsound
	verbosegiveitem POWER_LENS
	iffalse .Done
	writetext .GoodbyeText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SCARYCAVE1F_MIRA
	pause 15
	special Special_FadeInQuickly
	clearevent EVENT_BATTLE_TOWER_MIRA
	end

.Done:
	closetext
	end

.No:
	writetext .NoText
	waitbutton
	closetext
	end

.ChallengeText:
	text "I'm Mira…"
	line "I was catching"
	cont "#mon, but the"

	para "ghosts here are"
	line "scary…"

	para "I want to get"
	line "tougher so I won't"
	line "be such a scaredy-"
	cont "cat."

	para "Please! Please"
	line "battle with me!"
	done

.YesText:
	text "Yes! Mira will"
	line "show you her #-"
	cont "mon!"
	done

.NoText:
	text "Mira is sad…"
	done

.BeatenText:
	text "Mira wants to get"
	line "a lot, lot strong-"
	cont "er, like <PLAYER>!"
	done

.ItemText:
	text "<PLAYER>, did you"
	line "get to be so good"

	para "because you're al-"
	line "ways with your"
	cont "#mon?"

	para "Yes! That has to"
	line "be it!"

	para "Mira is beginning"
	line "to understand!"

	para "Thank you,"
	line "<PLAYER>!"

	para "Mira wants you to"
	line "have this!"
	done

.GoodbyeText:
	text "Mira will try like"
	line "you, <PLAYER>!"

	para "I'll get stronger"
	line "at the Battle"
	cont "Tower!"

	para "<PLAYER>,"
	line "bye-bye!"
	done

ScaryCave1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
	iftrue ScaryCave1FTutorSuckerPunchScript
	writetext ScaryCave1FPharmacistText
	waitbutton
	setevent EVENT_LISTENED_TO_SUCKER_PUNCH_INTRO
ScaryCave1FTutorSuckerPunchScript:
	writetext .QuestionText
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	yesorno
	iffalse .TutorRefused
	writebyte SUCKER_PUNCH
	writetext .ClearText
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext .RefusedText
	waitbutton
	closetext
	end

.QuestionText:
	text "I'll teach you to"
	line "Sucker Punch, but"

	para "I want a Silver"
	line "Leaf."
	done

.RefusedText:
	text "It's your funeral."
	done

.ClearText:
	text ""
	done

.NoSilverLeaf
	waitbutton
	writetext .NoSilverLeafText
	waitbutton
	closetext
	end

.NoSilverLeafText:
	text "No Silver Leaf?"
	line "Forget it then."
	done

.TeachMove
	takeitem SILVER_LEAF
	writetext .TaughtText
	waitbutton
	closetext
	end

.TaughtText:
	text "Now you can use"
	line "Sucker Punch!"

	para "If a foe is about"
	line "to hit you, you"
	cont "hit them first!"
	done

ScaryCave1FPharmacistText:
	text "Ghosts are masters"
	line "of the cheap shot."

	para "The way to deal"
	line "with them is to"
	cont "hit them first!"

	para "Give 'em a good"
	line "surprise Sucker"
	cont "Punch!"
	done

TrainerRuin_maniacSmilte:
	trainer EVENT_BEAT_RUIN_MANIAC_SMILTE, RUIN_MANIAC, SMILTE, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "I'm on the edge of"
	line "a big discovery!"

	para "I can just feel"
	line "it!"
	done

.BeatenText:
	text "Are you after my"
	line "discovery?!"
	done

.AfterText:
	text "I hear an echo."
	line "There's a deeper"
	cont "cave nearby!"

	para "I wonder if that"
	line "is where I'll find"
	cont "my big discovery…"
	done

TrainerSuper_nerdMako:
	trainer EVENT_BEAT_SUPER_NERD_MAKO, SUPER_NERD, MAKO, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "You can't beat me!"
	line "I've got the per-"
	cont "fect plan!"
	done

.BeatenText:
	text "My plan failed?!"

	para "Back to the draw-"
	line "ing board…"
	done

.AfterText:
	text "I guess even the"
	line "best-laid plans"
	cont "can be ruined."
	done

TrainerCoupleJoeandjo1:
	trainer EVENT_BEAT_COUPLE_JOE_AND_JO, COUPLE, JOEANDJO1, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Joe: A ghost!"
	line "Stay close, my"
	cont "dear Jo!"
	done

.BeatenText:
	text "Joe: Oh. It was"
	line "just a trainer."
	done

.AfterText:
	text "Joe: We're on a"
	line "ghost hunt, but"

	para "I'm not scared as"
	line "long as I have my"
	cont "Jo beside me!"
	done

TrainerCoupleJoeandjo2:
	trainer EVENT_BEAT_COUPLE_JOE_AND_JO, COUPLE, JOEANDJO2, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "Jo: Eek! Hold me"
	line "tight, Joe!"
	done

.BeatenText:
	text "Jo: Aren't you"
	line "scared?"
	done

.AfterText:
	text "Jo: I'm so lucky"
	line "to have my wonder-"
	cont "ful Joe to ward"

	para "off any creepy"
	line "ghosts."
	done

TrainerHex_maniacBethany:
	trainer EVENT_BEAT_HEX_MANIAC_BETHANY, HEX_MANIAC, BETHANY, .SeenText, .BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end

.SeenText:
	text "BOO!"
	done

.BeatenText:
	text "Did I scare you?"
	done

.AfterText:
	text "The aura of fear"
	line "in this cave is"
	cont "delightful…"
	cont "Fufufufu…"
	done

ScaryCave1FXSpclDef:
	itemball X_SPCL_DEF

ScaryCave1FDuskStone::
	itemball DUSK_STONE

ScaryCave1FHyperPotion:
	itemball HYPER_POTION

ScaryCave1FMaxRepel:
	itemball MAX_REPEL

ScaryCave1FRevive:
	itemball REVIVE

ScaryCave1FHiddenMaxElixir:
	dwb EVENT_SCARY_CAVE_1F_HIDDEN_MAX_ELIXIR, MAX_ELIXER

ScaryCave1FHiddenPearlString:
	dwb EVENT_SCARY_CAVE_1F_HIDDEN_PEARL_STRING, PEARL_STRING

ScaryCave1FHiddenPearl:
	dwb EVENT_SCARY_CAVE_1F_HIDDEN_PEARL, PEARL

ScaryCave1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $1f, $21, 1, URAGA_CHANNEL_EAST
	warp_def $1f, $b, 1, URAGA_CHANNEL_WEST
	warp_def $1e, $14, 1, SCARY_CAVE_B1F
	warp_def $a, $22, 2, SCARY_CAVE_B1F
	warp_def $1, $9, 1, SCARY_CAVE_SHIPWRECK

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 3, 34, SIGNPOST_ITEM, ScaryCave1FHiddenMaxElixir
	signpost 28, 18, SIGNPOST_ITEM, ScaryCave1FHiddenPearlString
	signpost 29, 30, SIGNPOST_ITEM, ScaryCave1FHiddenPearl

.PersonEvents:
	db 12
	person_event SPRITE_MIRA, 5, 15, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ScaryCave1FMiraScript, EVENT_SCARY_CAVE_MIRA
	person_event SPRITE_PHARMACIST, 23, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ScaryCave1FPharmacistScript, -1
	person_event SPRITE_POKEFAN_M, 2, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerRuin_maniacSmilte, -1
	person_event SPRITE_SUPER_NERD, 18, 8, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerSuper_nerdMako, -1
	person_event SPRITE_YOUNGSTER, 20, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerCoupleJoeandjo1, -1
	person_event SPRITE_LASS, 20, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerCoupleJoeandjo2, -1
	person_event SPRITE_HEX_MANIAC, 29, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, TrainerHex_maniacBethany, -1
	person_event SPRITE_BALL_CUT_FRUIT, 7, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, ScaryCave1FXSpclDef, EVENT_SCARY_CAVE_1F_X_SPCL_DEF
	person_event SPRITE_BALL_CUT_FRUIT, 9, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, ScaryCave1FDuskStone, EVENT_SCARY_CAVE_1F_DUSK_STONE
	person_event SPRITE_BALL_CUT_FRUIT, 19, 33, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, ScaryCave1FHyperPotion, EVENT_SCARY_CAVE_1F_HYPER_POTION
	person_event SPRITE_BALL_CUT_FRUIT, 23, 28, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, ScaryCave1FMaxRepel, EVENT_SCARY_CAVE_1F_MAX_REPEL
	person_event SPRITE_BALL_CUT_FRUIT, 29, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_ITEMBALL, 0, ScaryCave1FRevive, EVENT_SCARY_CAVE_1F_REVIVE
