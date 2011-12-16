What Has Gone Before
     The game Baldur's Gate and it's expansion pack Tales of the Sword Coast while an enjoyable experience is known to still contain errors throughout the game.  While some situations pass by unoticeably due to specifc roleplay, other situations are blatantly present. There have been several attempts over the years to provide corrections to many of these situations. First there was Kevin Dorner and his fix pack called "Baldurdash". Then there was Dudley and his broad collection of fixes and arguably extreme modifications towards a more D&D Pen & Paper style experience which collectively have become known as "Dudleyville". Following the advent of WeiDU, Idobek at Gibberlings3.net began to create a weidu based fix pack which was to combine the many elements of Baldurdash and Dudleyville into a singular easy to install and uninstall package. This project was never finished and was in fact abandoned with many of it's questionable elements transferring to a new project called Unfinished Buisness. It is here that an upstart modder with barely any knowledge of the previous fix packs took on the daunting task of creating a singular weidu based fix pack.

Installation
*add content*

Uninstallation
*add content*

Component Contents
   #0  Required for all components
       Without this component there will be no options to install anything else. This component is used to check WinXP systems for a rare but game breaking install. Seems that under some unknown conditions the installation of ToTSC and the consecutive patch doesn't remove the override contents of the vanilla game. This can introduce an untold number of issues and incompatibilities with any mods that may use those files. 39 files are looked for and moved to a backup location.  Also the Mac 5512 patch for ToTSC was incomplete, devsin has provided the necessary patches to correctly bring the Mac version to an identical state as the Win version.

   #1  Core Components
       These are patches which fix broken elements of the game. This can be small subtle things such as an incorrect file reference as well as larger solutions to prevent exploiting game mechanics.  See below for a breakdown.

   #2  Game Text Update
       Salk has provided us with a "merging of the best" text strings. Sources were the vanilla game, ToTSC expansion, Baldurdash, and Dudleyville. He also standardized spacing, line spacing, as well as spell & item descriptions. Included are also a few item file adjustments (such as weight) which are needed to match corrected descriptions. A few files also needed to be redirected to the correct identified or unidentified names.

   #3  Optional: Oublek & Prism - No Exploit & Multiple Ways to Solve Quest
       Replaces the exploit solution in the core components with an exploit work around by creating two specific emeralds to turn in for the bounty. Also provides for other methods of gaining the emeralds. Play around with it ^^  HINT: if for some reason you cannot find the emeralds, check the statue.

   #4  Optional: Multi-player friendly pickpocket fix for bandit scalps
       Reverses the exploit solution in the core components by moving the scalps to a non-pickpocketable slot and thus keeping the pickpocketable status on the item so that players in a multi-player game can steal them from each other.

   #5  Optional:  Restore Chapter 5 start to Vanilla BG behaviour
       For ToTSC games.  This changes the annoying chapter change that happens upon the death of the mine's boss.  It reverts it back to the area triggers in the vanilla game which are located at the exits of the map.

   #6  Optional:  Friendly Arm Inn Hidden Container Restoration
       For vanilla games.  This adds the hidden container (along with it's treasure) to the map where the Friendly Arm Inn is located.

Core Components Breakdown
PATCHmusicfix.tph
     Missing music files added; a check for Original Saga adds additional music files.
PATCH2dacorrections.tph
     Lore bonus modification -- per dudley
     Ranger stealth modification -- per dudley
     Weapon Specialization modification -- per dudley
     Exp level fix for priest & druids
     Alignment by Class table fix
PATCHarerestingspawnoffset.tph
     Area with resting spawn offset pointing to an incorrect location (inside header section) is redirected to the end of the file and additional empty space added to prevent editors from further flipping out
PATCHarescriptassignments.tph
     Assign matching script filename if no script exists. if the assigned script filename doesn't match but exists, copy and rename so that it matches.
PATCHaretrapsnoscript.tph
     Areas with containers or doors that are set to be trapped but have no assigned script have the trapped setting negated
PATCHar0717Idobekfix.tph
     A patch from Idobek which resolves a game crash when entering area ar0717.
PATCHarecontainerhighlights.tph
     Several area files with containers that are incorrectly highlighted have had the highlights adjusted.
PATCHar0300.tph
     An area file with a door locked in the vanilla game and unlocked with the expansion is relocked to be consistent
PATCHar3300fixA64.tph
     Beregost crash fix as supplied by Ascension64
PATCHareambfix.tph
     Area files with missing ambient sound assignments are reassigned other existing ambient sounds
PATCHareundetecttraps.tph
     Area files with trapped containers already detected, get the containers undetected
PATCHar0511fix.tph
     Change monster only usable items found in containers to player usable items
PATCHarespawnpointfix.tph
     Adjust the spawn point of a particular spawn so that it is closer to where the player is likely to wander



PATCHareafixes.tph
     A search of all area files (minus a list of ARE files not used by the game) looking for specific cirucmstances.  Those circumstances being:
       area script reference not matching the area file. No empty scripts created just ensure that the assignment matches the file name. If a script assigned exists and does not match it is copied and renamed to match. This is done so that modders can utilize the area check method developed for BG1 by Zed Nocear -- http://forums.gibberlings3.net/index.php?s=&showtopic=13858&view=findpost&p=119631
       ar0608.are -- while it has no resting spawn data, it points to an incorrect location. this could cause some issues should someone decide they want to add a resting spawn entry in their mod. changes the offset to the end of the file and adds in empty space for the resting spawn data
       there are containers and doors that are trapped but have no trap script assigned to them. Since it is unclear to know what script to add to these containers, the trapped value is negated.
     ar0717.are -- baldurdash based crash fix coded by Idobek
     ar0105.are, ar0004.are, ar0018.are, ar0101.are, ar0709.are, ar0715.are, ar0159.are -- container highlights not accurately drawing around the container graphic. dudley based patches.
     ar0300.are -- a door is locked in the vanilla version but unlocked in the totsc version, lock it to be consistent.
     ar3300.are -- beregost crash fix as coded by Ascension64
     ar0100.are, ar0200.are, ar0300.are, ar0400.are, ar0600.are, ar0621.are, ar0800.are, ar1100.are, ar1200.are, ar1400.are, ar1900.are, ar3300.are, ar4200.are, ar4300.are, ar4700.are, ar5400.are, ar5500.are -- replace non-existant ambient sounds with appropriate existing ambient sounds
     ar0500.are, ar0511.are, ar0512.are, ar0513.are, ar0514.are, ar1501.are, ar1502.are, ar1503.are, ar1504.are, ar3336 -- some trapped containers are already detected, changed to undetected.
     ToTSC only changes
     -- ar0511.are -- has a proximity trigger mislabled as an info trigger also replaces undroppable monster versions of a shield and helmet found in containers with an appropriate player usable version.
     -- ar2000.are -- one of the creature spawn points was shifted.


PATCHcreaturefixes.tph
PATCHdialogfixes.tph
PATCHitemfixes.tph
PATCHscriptfixes.tph
PATCHsituationfixes.tph
PATCHspellfixes.tph