
#lang reader "txtadv-reader.rkt"

===VERBS===

north, n
 "go north"

south, s
 "go south"

east, e
 "go east"

west, w
 "go west"

left, l
 "go left"

right, r
 "go right"

back
 "go back"

up
 "go up"

down
 "go down"

in, enter
 "enter"

out, leave
 "leave"

get _, grab _, take _
 "take"

put _, drop _, leave _
 "drop"

open _, unlock _
 "open"

close _, lock _
 "close"

knock _

quit
 "quit"

look, show
 "look"

inventory
 "check inventory"

help

save

load

cry, sob
 "cry"

exit
 "exit"

die
 "die"

===EVERYWHERE===

quit 
 (begin
  (printf "Bye!\n")
  (exit))

look 
 (show-current-place)

inventory 
 (show-inventory)

save
 (save-game)

load
 (load-game)

help
 (show-help)

cry
 (begin
   (printf "You lay down on the ground and cry becasue this is just too much.\n"))

exit
 (begin
   (printf "You go outside. It is snowing. You can't see. It's very cold.\n"))

die
 (begin
   (displayln "exiting")
   (exit))


===THINGS===



---cactus---
get
  "Ouch!"

---door---
open 
  (if (have-thing? key)
      (begin
        (set-thing-state! door 'open)
        "The door is now unlocked and open.")
      "The door is locked.")

close
  (begin
   (set-thing-state! door #f)
   "The door is now closed.")

knock
  "No one is home."

---key---

get
  (if (have-thing? key)
      "You already have the key."
      (begin
        (take-thing! key)
        "You now have the key."))

put
  (if (have-thing? key)
      (begin
        (drop-thing! key)
        "You have dropped the key.")
      "You don't have the key.")

---trophy---

get
  (begin
   (take-thing! trophy)
   "You win!")


===PLACES===

---Rekhi-112---
"You're standing in Rekhi 112."
[]

out
 Hallway-level-1-1

---Outside---
"You go outside. It is snowing. You can't see. It's very cold."
[]

north
 death

south
 death

east
 death

west
 death

in
 Hallway-level-1-4

---death---
"You died"
[]


---Rekhi-101---
"You've entered Rekhi 101. Theres nothing here. Why do we even have this room?"
[]

out
 Hallway-level-1-3

---Hallway-level-1-1---
"You're in the hallway, facing the wall. It's blank."
[]

left
 Hallway-level-1-3

in
 Rekhi-112

right
 Hallway-level-1-2

---Rekhi-113---
"You're in Rekhi 113"
[]

out
 Hallway-level-1-2

---CSLC---
"You're in the CSLC. The queue is full. Everyone needs help. Run."
[]

out
 Hallway-level-1-2

---Hallway-level-1-2---
"You're standing in the middle of the hallway. The CSLC is in front of you. Why don't you go in?"
[]

in
 CSLC

right
 Hallway-level-1-1

---Hallway-level-1-3---
"You're in the hallway, facing the room 101. The floor is sticky."
[]

in
 Rekhi-101

left
 Hallway-level-1-4

---Hallway-level-1-4---
"You're in the hallway, next to the stairs and exit. It's cold. It's always cold"
[]

exit
 Outside

out
 Outside

in
 Stairway-level-1-1

back
 Hallway-level-1-3

---Stairway-level-1-1---
"You're in the stairway. You know how to climb stairs, right?"
[]

out
 Hallway-level-1-4

---house-front---
"You are standing in front of a house."
[door]

in 
  (if (eq? (thing-state door) 'open)
      room
      "The door is not open.")

south
  Rekhi-112


---desert---
"You're in a desert. There is nothing for miles around."
[cactus, key]

north
  Rekhi-112

south
  desert

east
  desert

west
  desert


---room---
"You're in the house."
[trophy]

out
  house-front
