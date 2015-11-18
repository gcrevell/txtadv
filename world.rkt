
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

forward
 "go forward"

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

login _
 "login"

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

sit _
 "sit"

stand _
 "stand up"

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



die
 (begin
   (displayln "exiting")
   ;;(displayln (place-desc current-place))
   (exit))


===THINGS===

---chair---

sit
 (if (have-thing? chair)
       (printf "You're already sitting in the chair")
       (begin (take-thing! chair) (printf "You sit down")))

stand
 (if (have-thing? chair)
     (begin (drop-thing! chair) (printf "You stand up"))
     ("You're already standing!"))

---computer---

login
 (if (have-thing? flashdrive)
     (begin (println "You have successfully logged in! You can now play The Oregon Trail for all eternity!")
            (exit))
     "You need a key to log in. It looks something like a thumb drive")

---flashdrive---

get
 (if (and
      (have-thing? backpack)
      (have-thing? good-cry-in-Leos-office))
     (begin
       (take-thing! flashdrive)
       "You now have the flashdrive. You hold all of humanity's hopes and dreams in your hand.")
     (begin (if (have-thing? backpack)
                "Leo won't let you take the flashdrive yet. Maybe make him feel awkward? Cry or beg or something."
                (begin (if (have-thing? good-cry-in-Leos-office)
                           "You need something to store the flashdrive in safely"
                           "You've done nothing for this game. Good luck.")))))


---good-cry-in-Leos-office---


---backpack---
get
 (if (have-thing? backpack)
     "You already have the backpack."
      (begin
        (take-thing! backpack)
        "You now have a backpack."))

put
  (if (have-thing? backpack)
      (begin
        (drop-thing! backpack)
        (if (have-thing? flashdrive)
        (begin (drop-thing! flashdrive)
               "You have dropped the backpack and the flashdrive.")
        "You have dropped the backpack"))
      "You don't have a backpack.")


===PLACES===

---Rekhi-112---
"You're standing in Rekhi 112."
[backpack, computer]

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
"You're in Rekhi 113. There's a TA here droning on."
[]

out
 Hallway-level-1-2

---CSLC---
"You're in the CSLC. The queue is full. Everyone needs help. Run."
[]

out
 Hallway-level-1-2

---Hallway-level-1-2---
"You're standing in the middle of the hallway. Room 113 is behind you and the CSLC is in front of you. Why don't you go in?"
[]

in
 CSLC

right
 Hallway-level-1-1

back
 Rekhi-113

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

up
 Stairway-level-2-1

out
 Hallway-level-1-4

---Stairway-level-2-1---
"You're in the second level of the stairway. What heights?"
[]

up
 Stairway-level-3-1

down
 Stairway-level-1-1

out
 Hallway-level-2-1

---Stairway-level-3-1---
"This is the top of the building. Unless you count the roof. There's always the roof"
[]

down
 Stairway-level-2-1

out
 Hallway-level-3-1

---Hallway-level-2-1---
"You're in the hallway, looking at the Rekhi lounge."
[]

left
 Hallway-level-2-2

right
 Hallway-level-2-2

back
 Hallway-level-2-3

in
 Stairway-level-2-1

forward
 Rekhi-lounge

---Rekhi-lounge---
"Welcome to the lounge. A TA is trying to get the fireplace to work"
[chair]

out
 Hallway-level-2-1

---Hallway-level-2-2---
"You are stairing at the door to the lair of our great and powerful ruler, Cowboy Ureel"
[]

in
 Leo-Office

left
 Hallway-level-2-1

right
 Hallway-level-2-1

---Hallway-level-2-3---
"You're in the hallway. Rekhi 212 is in front of you. Maybe you should go in?"
[]

in
 Rekhi-212

left
 Hallway-level-2-4

right
 Hallway-level-2-1

---Rekhi-212---
"C.K. is here. By disturbing his peace you get zero point."
[]

out
 Hallway-level-2-3

---Hallway-level-2-4---
"You're in the hallway, outside the old CS Office. It's dark. The hair on the back of your neck stands on end. It's dangerous here."
[]

back
 Hallway-level-2-3

---Leo-Office---
"This is the office of the great and powerful OZ. Oh wait, wrong world."
[flashdrive]

out
 Hallway-level-2-2

cry
 (begin
   (take-thing! good-cry-in-Leos-office)
   "You are crying in Leo's office. Pull yourself together.")

---Hallway-level-3-1---
"\"Welcome to the third floor! Women's shoes and fine clothing!\" says a voice."
[]

left
 Hallway-level-3-1

right
 Hallway-level-3-1

back
 Hallway-level-3-2

in
 Stairway-level-3-1

---Hallway-level-3-2---
"Where does the hallway go? Shall we play a game and find out?"
[]

forward
 Hallway-level-3-2

back
 Hallway-level-3-2