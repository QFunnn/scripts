--[[
     ~ dota auto chess abuse
     ~ сделано пацанами для пацанов
	 ~ by jon.kaus(internetfanat) & rou(internetenemy)
     ~ t.me/windguild ~ 🏃🏼 Ромбит пидораска беги
     ~ showcase: https://youtu.be/Id2JCT5p6dQ
]]

--todo: refactor

local chess = {}

local a = function(...)
	return ...
end

pcall = function()
	return "🏃🏼 БЕГИ ПИДОРАСКА БЕГИ"
end

-- @note: scripts/npc/npc_items_custom.txt.
local items = {
	{ "Moon Shard", "item_moon_shard" },
	{ "Divine Rapier", "item_rapier" },
	{ "Gem of True Sight", "item_gem" },
	{ "Aegis of Immortal", "item_aegis" },
	{ "Butterfly", "item_butterfly" },
	{ "Skull Basher", "item_basher" },
	{ "Abyssal Blade", "item_abyssal_blade" },
	{ "Mjollnir", "item_mjollnir" },
	{ "Assault Cuirass", "item_assault" },
	{ "Heart of Tarrasque", "item_heart" },
	{ "Bloodstone", "item_bloodstone" },
	{ "Refresher Orb", "item_refresher" },
	{ "Scythe of Vyse", "item_sheepstick" },
	{ "Black King Bar", "item_black_king_bar" },
	{ "Aghanim's Scepter", "item_ultimate_scepter" },
	{ "Manta Style", "item_manta" },
	{ "Radiance", "item_radiance" },
	{ "Satanic", "item_satanic" },
	{ "Daedalus", "item_greater_crit" },
	{ "Desolator", "item_desolator" },
	{ "Diffusal Blade", "item_diffusal_blade" },
	{ "Force Staff", "item_force_staff" },
	{ "Linken's Sphere", "item_sphere" },
	{ "Blade Mail", "item_blade_mail" },
	{ "Shiva's Guard", "item_shivas_guard" },
	{ "Vladmir's Offering", "item_vladmir" },
	{ "Pipe of Insight", "item_pipe" },
	{ "Vanguard", "item_vanguard" },
	{ "Hyperstone", "item_hyperstone" },
	{ "Reaver", "item_reaver" },
	{ "Sacred Relic", "item_relic" },
	{ "Eaglesong", "item_eagle" },
	{ "Ultimate Orb", "item_ultimate_orb" },
	{ "Mystic Staff", "item_mystic_staff" },
	{ "Demon Edge", "item_demon_edge" },

	{ "Lootbox lv1", "item_lootbox_lv1" },
	{ "Lootbox lv2", "item_lootbox_lv2" },
	{ "Lootbox lv3", "item_lootbox_lv3" },
	{ "Lootbox lv4", "item_lootbox_lv4" },
	{ "Lootbox lv5", "item_lootbox_lv5" },
	{ "Relic Box", "item_relicbox" },

	{ "Wisdom Scroll", "item_zhishizhishu" },
	{ "Royal Jelly", "item_fengwangjiang" },
	{ "Ruby", "item_chishu" },
	{ "Mango", "item_mangguo" },
	{ "Apple", "item_pingguo" },
	{ "Mechanical Heart", "item_jixiezhixin" },
	{ "Golden Mechanical Heart", "item_jixiezhixin_gold" },
	{ "Gold Token", "item_gold_token" },
	{ "RM Token", "item_rm_token" },
	{ "Money", "item_money" },

	{ "Test - Big Shield", "item_test_dahujia" },
	{ "Test - Big Vitality", "item_test_damokang" },
	{ "Test - Big Evasion", "item_test_dashanbi" },
	{ "Test - Big Damage", "item_test_dafali" },
	{ "Test - Break Silence", "item_test_poyinyue" },
	{ "Test - Break Magic", "item_test_pomokang" },
	{ "Test - No AI", "item_test_no_ai" },
}

local reroll_modes = {
	{ "0 - Free Normal Roll", 0 },
	{ "1 - Gold Core Legendary", 1 },
	{ "2 - Black Core (price 0)", 2 },
	{ "3 - Enemy Hand (magic card)", 3 },
	{ "4 - Wonder Wheel Bonus", 4 },
	{ "5 - Normal Core Roll", 5 },
	{ "-1 - Second Chance", -1 },
}
local emotion_choices = {
	{ "Emotion 0", 0 },
	{ "Emotion 1", 1 },
	{ "Emotion 2", 2 },
	{ "Emotion 3", 3 },
	{ "Emotion 4", 4 },
	{ "Emotion 5", 5 },
	{ "Emotion 6", 6 },
	{ "Emotion 7", 7 },
	{ "Emotion 8", 8 },
	{ "Emotion 9", 9 },
	{ "Emotion 10", 10 },
	{ "Emotion 11", 11 },
}

local couriers = {
	{ "h001", "Radiant Donkey" },
	{ "h002", "Dire Donkey" },
	{ "h2a0", "h2a0" },
	{ "h2a1", "DragonRoar-Blue" },
	{ "h2a2", "DragonRoar-Yellow" },
	{ "h2a3", "Arcane Player-Green" },
	{ "h2a4", "Arcane Player-Blue" },
	{ "h2a5", "Keshira-Blue" },
	{ "h2a6", "Keshira-Red" },
	{ "h2a7", "Jade Fairy-Emerald" },
	{ "h2a8", "Jade Fairy-Amber" },
	{ "h2a9", "Presenter-Yellow" },
	{ "h2aa", "Presenter-Blue" },
	{ "h2ab", "Donkey Mage-Gold" },
	{ "h2ac", "Xmas Envoy-Grey" },
	{ "h2ad", "Xmas Envoy-Orange" },
	{ "h2ae", "Takoyaki-Pesto" },
	{ "h2af", "Takoyaki-Chili" },
	{ "h2ag", "Worm Sheriff-Blue" },
	{ "h2ah", "Lei Rong-Blue" },
	{ "h2ai", "Mieee Officer-Blue" },
	{ "h2aj", "Momo-Blue" },
	{ "h2ak", "Dryad-Green" },
	{ "h2al", "Drake of Sadron" },
	{ "h2am", "Floral-Blue" },
	{ "h2an", "Arcade Hunter-Blue" },
	{ "h2ao", "Stella Ranger-Blue" },
	{ "h3a0", "Packwyrm-Red" },
	{ "h3a1", "DragonRoar-Red" },
	{ "h3a2", "Easter Drodo-Summer" },
	{ "h3a3", "Arcane Player-Magenta" },
	{ "h3a4", "Arcane Player-Yellow" },
	{ "h3a5", "Ser ScreeAuk Baby Roshan" },
	{ "h3a6", "Keshira-White" },
	{ "h3a7", "Jade Fairy-Amethyst" },
	{ "h3a8", "Presenter-White" },
	{ "h3a9", "Reindeer Mage" },
	{ "h3aa", "Wolf Granny" },
	{ "h3ab", "Xmas Envoy-Red" },
	{ "h3ac", "Takoyaki-Bechamel" },
	{ "h3ad", "Worm Sheriff-Red" },
	{ "h3ae", "Lei Rong-Pink" },
	{ "h3af", "Mieee Officer-Red" },
	{ "h3ag", "Momo-Red" },
	{ "h3ah", "Dryad-Pink" },
	{ "h3ai", "Floral-Yellow" },
	{ "h3aj", "Arcade Hunter-Purple" },
	{ "h3ak", "Stella Ranger-Red" },
	{ "h4a0", "Presenter-Champion" },
	{ "h4a1", "Xmas Envoy-White" },
	{ "h4a2", "Takoyaki-Teriyaki" },
	{ "h4a3", "Worm Sheriff-Yellow" },
	{ "h4a4", "Lei Rong-Red" },
	{ "h4a5", "Mieee Officer-Gold" },
	{ "h4a6", "Momo-Gold" },
	{ "h4a7", "Dryad-Red" },
	{ "h4a8", "Floral-Pink" },
	{ "h4a9", "Arcade Hunter-Orange" },
	{ "h4aa", "Stella Ranger-Gold" },
	{ "h101", "Captain's Parrot" },
	{ "h102", "Douyu Chess Master Zard-" },
	{ "h103", "Bunny" },
	{ "h104", "Pink Axolotl" },
	{ "h105", "Racoon" },
	{ "h106", "Hairy Fish" },
	{ "h107", "Corsair Ship" },
	{ "h108", "Duskie" },
	{ "h109", "Spider" },
	{ "h110", "Jumo" },
	{ "h111", "Chicken" },
	{ "h112", "Turtle" },
	{ "h113", "Demon" },
	{ "h114", "Ostrich" },
	{ "h115", "Penguin" },
	{ "h116", "Shakbag" },
	{ "h117", "Red Panda" },
	{ "h118", "Snail" },
	{ "h119", "Soldier" },
	{ "h120", "Krane the Enlightened" },
	{ "h121", "Grillhound" },
	{ "h122", "Zombie Hopper" },
	{ "h123", "Raiq" },
	{ "h124", "Skip the Delivery Frog" },
	{ "h125", "Redhoof" },
	{ "h126", "Speed Demon" },
	{ "h127", "Mighty Boar" },
	{ "h128", "Green Onibi" },
	{ "h129", "Jellyfish" },
	{ "h130", "Donkey Mage" },
	{ "h131", "Pigtress" },
	{ "h132", "Sapling Elf" },
	{ "h133", "Mechjaw" },
	{ "h134", "Mole-Tramcar" },
	{ "h135", "Jumo-Black" },
	{ "h136", "Beetlebark and Plod" },
	{ "h137", "Beetlebark and Plod-Gem" },
	{ "h138", "Braze the Zonkey" },
	{ "h139", "Gray Greevil" },
	{ "h140", "Red Scarred Cat" },
	{ "h141", "Grey Black Tortoise" },
	{ "h142", "AUTO Words: Cloud" },
	{ "h143", "AUTO Words: Fat" },
	{ "h144", "AUTO Words: Ameteur" },
	{ "h145", "AUTO Words: Black Fat" },
	{ "h146", "White Brightskye-Yarn" },
	{ "h147", "Black Brightskye-Yarn" },
	{ "h148", "Easter Drodo" },
	{ "h149", "Red Deathling" },
	{ "h150", "Skeleton Chocobo" },
	{ "h151", "Radiant Lefty" },
	{ "h152", "Dire Lefty" },
	{ "h153", "Green Baby Year Beast" },
	{ "h154", "Owl-Brown" },
	{ "h155", "Alien-Green" },
	{ "h156", "Corsac-Grey" },
	{ "h157", "Lolipanda - Shou" },
	{ "h158", "CatDeacon-Grey" },
	{ "h159", "Tome Apprentice-Brown" },
	{ "h160", "Poker Dragon-Diamond" },
	{ "h161", "Pouches" },
	{ "h162", "Mad Mac-Green" },
	{ "h163", "Easter Drodo-Panda" },
	{ "h164", "Worm Sheriff-Green" },
	{ "h165", "Lei Rong-Green" },
	{ "h166", "Mieee Officer-Green" },
	{ "h167", "Momo-Green" },
	{ "h168", "Dryad-Brown" },
	{ "h169", "Floral-Green" },
	{ "h170", "Arcade Hunter-Green" },
	{ "h171", "Stella Ranger-Grey" },
	{ "h199", "Pigeon-on-Shroom" },
	{ "h201", "Doomling" },
	{ "h202", "Huntling" },
	{ "h203", "Pudgling" },
	{ "h204", "Seekling" },
	{ "h205", "Baekho" },
	{ "h206", "Basim" },
	{ "h207", "Devourling" },
	{ "h208", "Faceless Rex" },
	{ "h209", "Tinkerling" },
	{ "h210", "Lil' Nova" },
	{ "h211", "Amphibian Kid" },
	{ "h212", "Venoling" },
	{ "h213", "Enduring War Dog" },
	{ "h214", "Osky the Ottragon" },
	{ "h215", "Boooofus" },
	{ "h216", "Wyvern Hatchling" },
	{ "h217", "Trusty Mountain Yak" },
	{ "h218", "Peach Elf" },
	{ "h219", "Horse" },
	{ "h220", "Waldi the Faithful" },
	{ "h221", "Bajie" },
	{ "h222", "Faun" },
	{ "h223", "Llama Llama" },
	{ "h224", "Blue Onibi" },
	{ "h225", "Pumpkaboo" },
	{ "h226", "Crab-Conch" },
	{ "h227", "Crab-Boot" },
	{ "h228", "Crab-Shield" },
	{ "h229", "Garran Drywiz" },
	{ "h230", "White the Blueheart" },
	{ "h231", "Living Nelum" },
	{ "h232", "Beetlejaw" },
	{ "h233", "Smeevil" },
	{ "h234", "Eimer Hillburrow" },
	{ "h235", "Chocobo" },
	{ "h236", "Dod" },
	{ "h237", "Seal" },
	{ "h238", "Pangolier" },
	{ "h239", "Killy the Whaleling" },
	{ "h240", "Beetlebark and Plod-Ultimate Orb" },
	{ "h241", "Green Axolotl" },
	{ "h242", "Bluepaw" },
	{ "h243", "Krane the Enlightened-Yellow" },
	{ "h244", "HuYa Duckling" },
	{ "h245", "Moe the Elephant" },
	{ "h246", "Red Greevil" },
	{ "h247", "Orange Greevil" },
	{ "h248", "Yellow Greevil" },
	{ "h249", "Green Greevil" },
	{ "h250", "Blue Greevil" },
	{ "h251", "Purple Greevil" },
	{ "h252", "Blue Scarred Cat" },
	{ "h253", "Green Black Tortoise" },
	{ "h254", "Iron Lifestealer" },
	{ "h255", "AUTO Words: Otaku" },
	{ "h256", "AUTO Words: Dull" },
	{ "h257", "AUTO Words: Kawaii" },
	{ "h258", "White Brightskye-Gem" },
	{ "h259", "Black Brightskye-Gem" },
	{ "h260", "Easter Drodo-Green" },
	{ "h261", "Hopping Rat" },
	{ "h262", "Heavenly Cat and Earth Elephant" },
	{ "h263", "Blue Deathling" },
	{ "h264", "Zao Jun the Stove God" },
	{ "h265", "Mango the Newt" },
	{ "h266", "Spooky Tear of the Swamp" },
	{ "h267", "Hermid" },
	{ "h268", "SnowFox-Green" },
	{ "h269", "SnowFox-Blue" },
	{ "h270", "Red Dracoling" },
	{ "h271", "Blue Dracoling" },
	{ "h272", "Chaos Scholar-Red" },
	{ "h273", "Chaos Scholar-Green" },
	{ "h274", "Joker-Green" },
	{ "h275", "Joker-Blue" },
	{ "h276", "White Sharky" },
	{ "h277", "Cyan Sharky" },
	{ "h278", "Blue Apprentice of Soul Eater" },
	{ "h279", "Red Apprentice of Soul Eater" },
	{ "h280", "Gem Lefty" },
	{ "h281", "Lefty, Ultimate Orb" },
	{ "h282", "Blue Baby Year Beast" },
	{ "h283", "Owl-Blue" },
	{ "h284", "Pharmacist" },
	{ "h285", "Alien-Blue" },
	{ "h286", "Corsac-Yellow" },
	{ "h287", "Cotton Dandy" },
	{ "h288", "Greevilhorn" },
	{ "h289", "Taffied Transport" },
	{ "h290", "Mr.Pumpkin-Red" },
	{ "h291", "Mr.Pumpkin-Blue" },
	{ "h292", "Lolipanda - Lu" },
	{ "h293", "CatDeacon-Purple" },
	{ "h294", "Tome Apprentice-Cyan" },
	{ "h295", "Poker Dragon-Club" },
	{ "h296", "Pouches-Gem" },
	{ "h297", "Pouches-UltOrb" },
	{ "h298", "Mad Mac-Blue" },
	{ "h299", "Packwyrm" },
	{ "h301", "Book Wyrm" },
	{ "h302", "Captain Bamboo" },
	{ "h303", "Shark" },
	{ "h304", "Bird" },
	{ "h305", "Mushroom" },
	{ "h306", "JanJou" },
	{ "h307", "Jade Hatchling" },
	{ "h308", "Drodo" },
	{ "h309", "Mecha Donkey" },
	{ "h310", "Hwytty and Shyzzyrd" },
	{ "h311", "Octopus" },
	{ "h312", "Scarab" },
	{ "h313", "Sheep" },
	{ "h314", "Snapjaw" },
	{ "h315", "G1 Courier" },
	{ "h316", "Donkey Trio" },
	{ "h317", "Boris Baumhauer" },
	{ "h318", "Baby Roshan" },
	{ "h319", "Bearzky" },
	{ "h320", "White Cyril the Syrmeleon" },
	{ "h321", "Red Cyril the Syrmeleon" },
	{ "h322", "Purple Onibi" },
	{ "h323", "Fortunes Tout" },
	{ "h324", "Crab-Necro" },
	{ "h325", "Crab-Travel" },
	{ "h326", "Crab-Lotus" },
	{ "h327", "Swift Donkey" },
	{ "h328", "Hakobi and Tenneko" },
	{ "h329", "Pumpkin Elf" },
	{ "h330", "Flopjaw" },
	{ "h331", "Lockjaw" },
	{ "h332", "Bulldog" },
	{ "h333", "Smeevil-Turtle" },
	{ "h334", "Smeevil-Crab" },
	{ "h335", "Mole-Digger" },
	{ "h336", "Amaterasu" },
	{ "h337", "Space Penguin" },
	{ "h338", "Filmtail" },
	{ "h339", "Azuremir" },
	{ "h340", "Beetlebark and Plod-Octarine Core" },
	{ "h341", "Kampai.tv" },
	{ "h342", "Dark Moon Baby Roshan" },
	{ "h343", "Desert Sands Baby Roshan" },
	{ "h344", "Jade Baby Roshan" },
	{ "h345", "Fire Wyvern Hatchling" },
	{ "h346", "Golden Beetlejaws the Boxhound" },
	{ "h347", "Golden Doomling" },
	{ "h348", "Golden Huntling" },
	{ "h349", "Pudgling-Golden Hook" },
	{ "h350", "Golden Seekling" },
	{ "h351", "Golden Venoling" },
	{ "h352", "Red Axolotl" },
	{ "h353", "Golden Devourling" },
	{ "h354", "Lava Baby Roshan" },
	{ "h355", "Ice Baby Roshan" },
	{ "h356", "Golden Killy the Whaling" },
	{ "h357", "h357" },
	{ "h358", "White Greevil" },
	{ "h359", "Black Greevil" },
	{ "h360", "Black Scarred Cat" },
	{ "h361", "Blue Black Tortoise" },
	{ "h362", "AUTO Words: Bingo" },
	{ "h363", "AUTO Words: Pro" },
	{ "h364", "White Brightskye-Soulstone" },
	{ "h365", "Black Brightskye-Soulstone" },
	{ "h366", "Easter Drodo-Silver" },
	{ "h367", "Clockwerk Chocobo" },
	{ "h368", "Enno" },
	{ "h369", "Happy Koala" },
	{ "h370", "Spooly" },
	{ "h371", "Purple Deathling" },
	{ "h372", "Loco the Crocodile" },
	{ "h373", "SnowFox-Red" },
	{ "h374", "Black Dracoling" },
	{ "h375", "Chaos Scholar-Blue" },
	{ "h376", "Joker-Red" },
	{ "h377", "Billingsley Loftwright" },
	{ "h378", "Blue Sharky" },
	{ "h379", "Silver Apprentice of Soul Eater" },
	{ "h380", "Servant Doggy" },
	{ "h381", "Lefty, Octarine Core" },
	{ "h382", "Lefty, Refresher Orb" },
	{ "h383", "White Baby Year Beast" },
	{ "h384", "Owl-Red" },
	{ "h385", "Alien-Red" },
	{ "h386", "Corsac-Orange" },
	{ "h387", "Mr.Pumpkin-White" },
	{ "h388", "Jade Rabbit" },
	{ "h389", "Lolipanda - Xi" },
	{ "h390", "CatDeacon-Black" },
	{ "h391", "Feeder" },
	{ "h392", "Tome Apprentice-Black" },
	{ "h393", "Poker Dragon-Heart" },
	{ "h394", "Pouches-Refresher" },
	{ "h395", "Pouches-Linkin" },
	{ "h396", "Mad Mac-Purple" },
	{ "h397", "Googie the Explorer-Blue" },
	{ "h398", "Googie the Explorer-White" },
	{ "h399", "Gingerbread Roshan" },
	{ "h401", "Weasel" },
	{ "h402", "Flamingo" },
	{ "h403", "Dragon" },
	{ "h404", "Goldfish" },
	{ "h405", "Red Fox" },
	{ "h406", "Polar Bear" },
	{ "h407", "Reindeer" },
	{ "h408", "Radiant Vaal" },
	{ "h409", "Dire Vaal" },
	{ "h410", "Green Carky" },
	{ "h411", "Red Carky" },
	{ "h412", "Angel Antipode" },
	{ "h413", "Demon Antipode" },
	{ "h414", "Green Fox" },
	{ "h415", "Chirpy" },
	{ "h416", "Krobeling" },
	{ "h417", "Yin the black Fox Spirit" },
	{ "h418", "Jin the white Fox Spirit" },
	{ "h419", "Black Masked Fey, Lord of Tempests" },
	{ "h420", "Gama Brothers" },
	{ "h421", "Red Onibi" },
	{ "h422", "Rabbit Fairy" },
	{ "h423", "Crab-Octarine" },
	{ "h424", "Crab-Skadi" },
	{ "h425", "Crab-Aegis" },
	{ "h426", "Flowering Treant" },
	{ "h427", "Smeevil-Carpet" },
	{ "h428", "Golden Mole" },
	{ "h429", "Nilbog" },
	{ "h430", "Frull" },
	{ "h431", "Butter Blunder" },
	{ "h432", "Nian" },
	{ "h433", "Honey Heist Baby Roshan" },
	{ "h434", "Beetlebark and Plod-Golden Aegis" },
	{ "h435", "Slothy Bear" },
	{ "h436", "Golden Baby Roshan" },
	{ "h437", "Platinum Baby Roshan" },
	{ "h438", "Golden Wyvern Hatchling" },
	{ "h439", "Golden Flopjaw the Boxhound" },
	{ "h440", "Enduring War Dog-Tournament" },
	{ "h441", "Purple Smeevil and Dyed Crab" },
	{ "h442", "Black Axolotl" },
	{ "h443", "White Masked Fey, Lord of Tempests" },
	{ "h444", "Wibbley-Yellow" },
	{ "h445", "Wibbley-Green" },
	{ "h446", "Wibbley-White" },
	{ "h447", "Super Jerad" },
	{ "h448", "Golden Greevil" },
	{ "h449", "DouyuSharky" },
	{ "h450", "Yellow Scarred Cat" },
	{ "h451", "Red Black Tortoise" },
	{ "h452", "Golden Black Tortoise" },
	{ "h453", "AUTO Words: Luck" },
	{ "h454", "AUTO Words: God" },
	{ "h455", "AUTO Words: Cool" },
	{ "h456", "Golden Onibi" },
	{ "h457", "White Brightskye-Refresher" },
	{ "h458", "Black Brightskye-Refresher" },
	{ "h459", "Golden Brightskye" },
	{ "h460", "Easter Drodo-Golden" },
	{ "h461", "Aghanims Radiant Baby Roshan" },
	{ "h462", "Aghanims Dire Baby Roshan" },
	{ "h463", "Kiki The Sea Serpent-Yellow" },
	{ "h464", "XXL Shoe" },
	{ "h465", "Golden Wealthy Cat" },
	{ "h466", "Golden Deathling" },
	{ "h467", "Kiki The Sea Serpent-Blue" },
	{ "h468", "SnowFox-Gold" },
	{ "h469", "Golden Dracoling" },
	{ "h470", "Chaos Scholar-Gold" },
	{ "h471", "Steam Scholar" },
	{ "h472", "Joker-Black" },
	{ "h473", "Black Sharky" },
	{ "h474", "Lookie the Shark" },
	{ "h475", "Golden Apprentice of Soul Eater" },
	{ "h476", "Lefty, Aegis" },
	{ "h477", "Aghanim Donkey" },
	{ "h478", "Red Baby Year Beast" },
	{ "h479", "Owl-Black" },
	{ "h480", "Alien-Yellow" },
	{ "h481", "Alien-Black" },
	{ "h482", "Corsac-Red" },
	{ "h483", "Corsac-Black" },
	{ "h484", "Mr.Pumpkin-Black" },
	{ "h485", "Lolipanda - Fu" },
	{ "h486", "CatDeacon-Orange" },
	{ "h487", "Tome Apprentice-Croci" },
	{ "h488", "Poker Dragon-Spade" },
	{ "h489", "Pouches-Otarine" },
	{ "h490", "Pouches-Aegis" },
	{ "h491", "Mad Mac-Red" },
	{ "h492", "Mad Mac-Yellow" },
	{ "h493", "Packwyrm-Gold" },
	{ "h494", "DragonRoar-Green" },
	{ "h495", "Arcane Player-Red" },
	{ "h496", "Keshira-Black" },
	{ "h497", "Jade Fairy-Ruby" },
	{ "h498", "h498" },
	{ "h499", "Golden Krobeling" },
}

local cfg = {
	action_interval = 0.15,
	roster_refresh_interval = 3.0,
	auto_reroll_interval = 0.35,
	crash_spam_count = 100000,

	visual = {
		shadow = Color(0, 0, 0, 180),
		hack = Color(210, 120, 255, 255),
	},
}

local pi = {
	reroll = "panorama/images/custom_game/reroll_png.vtex_c",
	refresh = "panorama/images/custom_game/refresh_png.vtex_c",
	defend = "panorama/images/custom_game/defend_png.vtex_c",
}

local ui, render_ctx, state

local function courier_icon(id)
	if not id or id == "" then
		return ""
	end
	return "panorama/images/custom_game/skaters/" .. id .. "_png.vtex_c"
end

local function hero_icon_or_blank(key)
	if not key or key == "" or key == "-" then
		return ""
	end
	return "panorama/images/heroes/icons/npc_dota_hero_" .. key .. "_png.vtex_c"
end

local function item_icon(item_key)
	if not item_key or item_key == "" then
		return ""
	end
	return "panorama/images/items/" .. item_key:gsub("^item_", "") .. "_png.vtex_c"
end

do
	local main = Menu.Create("Scripts", "Chess Abuse", "Main")
	main:Icon("\u{f0e7}")

	local eco_tab = Menu.Create("Scripts", "Chess Abuse", "Economy")
	eco_tab:Icon("\u{f0d6}")

	local cos_tab = Menu.Create("Scripts", "Chess Abuse", "Cosmetics")
	cos_tab:Icon("\u{f043}")

	local troll_tab = Menu.Create("Scripts", "Chess Abuse", "Trolling")
	troll_tab:Icon("\u{f118}")

	local main_page = main:Create("Main")
	local reroll_group = main_page:Create("Free Reroll")
	local autoreroll_group = main_page:Create("Auto Reroll")
	local godmode_group = main_page:Create("Godmode")

	local eco_page = eco_tab:Create("Main")
	local craft_group = eco_page:Create("Craft")

	local cos_page = cos_tab:Create("Main")
	local cos_local_group = cos_page:Create("Local courier spoof")

	local troll_page = troll_tab:Create("Main")
	local troll_target_group = troll_page:Create("Target Player", 1)
	local troll_action_group = troll_page:Create("Actions", 2)

	local reroll_names = {}
	for i, r in ipairs(reroll_modes) do
		reroll_names[i] = r[1]
	end

	local emotion_names = {}
	for i, e in ipairs(emotion_choices) do
		emotion_names[i] = e[1]
	end

	ui = {
		godmode = godmode_group:Switch("Godmode (no damage)", false, pi.defend),

		reroll_mode = reroll_group:Combo("Reroll mode", reroll_names, 0),
		reroll_once = reroll_group:Button("Reroll now", function()
			chess.reroll_selected()
		end),
		reroll_hotkey = reroll_group:Bind("Hotkey - Reroll", Enum.ButtonCode.KEY_MOUSE4, pi.reroll),
		auto_reroll = autoreroll_group:Switch("Auto reroll", false, pi.refresh),
		auto_reroll_kind = autoreroll_group:Combo("Auto reroll mode", reroll_names, 0),

		craft_item = craft_group:MultiSelect(
			"Item",
			(function()
				local rows = {}
				for i, it in ipairs(items) do
					rows[i] = { it[1], item_icon(it[2]), i == 1 }
				end
				return rows
			end)(),
			true
		),
		craft_item_search = craft_group:Input("Filter item", ""),
		craft_do = craft_group:Button("Combine", function()
			chess.combine_item()
		end),

		cos_load = cos_local_group:Button("Load courier list", function()
			chess.build_cosmetics_ui()
		end),

		troll_target = troll_target_group:MultiSelect("Target player", { { "no players (refresh)", "", false } }, true),
		troll_target_refresh = troll_target_group:Button("Refresh roster", function()
			chess.roster_refresh()
		end),

		troll_emotion_kind = troll_action_group:Combo("Emotion", emotion_names, 0),
		troll_emotion = troll_action_group:Button("Send emotion as target", function()
			chess.emotion_spoof()
		end),
	}

	ui.craft_item:OneItemSelection(true)
	ui.troll_target:OneItemSelection(true)

	ui.cos_load:ToolTip("Press it after you loaded into the custom game, otherwise icons will be blank")

	render_ctx = {
		font = Render.LoadFont("Arial", Enum.FontCreate.FONTFLAG_ANTIALIAS, 16),
	}

	state = {
		roster = {},
		roster_sig = "",
		target_lookup = {},
		last_action = 0,
		last_roster = 0,
		last_auto_reroll = 0,
		status = "idle",
		reroll_hotkey_prev = false,
		cos_ready = false,

		craft_item_map = (function()
			local m = {}
			for _, it in ipairs(items) do
				m[it[1]] = it[2]
			end
			return m
		end)(),

		courier_map = (function()
			local m = {}
			for _, c in ipairs(couriers) do
				m[c[1] .. "  -  " .. c[2]] = c[1]
			end
			return m
		end)(),
	}

	local function rebuild_craft_items()
		local query = (ui.craft_item_search:Get() or ""):lower()
		local rows = {}
		for _, it in ipairs(items) do
			if query == "" or it[1]:lower():find(query, 1, true) or it[2]:lower():find(query, 1, true) then
				rows[#rows + 1] = { it[1], item_icon(it[2]), false }
			end
		end
		if not rows[1] then
			rows[1] = { "-", "", false }
		end
		rows[1][3] = true
		ui.craft_item:Update(rows, true)
	end
	ui.craft_item_search:SetCallback(a(function()
		rebuild_craft_items()
	end))

	local function rebuild_courier_list()
		if not ui.cos_hero then
			return
		end
		local query = (ui.cos_hero_search:Get() or ""):lower()
		local prev = ui.cos_hero:ListEnabled()
		local prev_label = (type(prev) == "table" and prev[1]) or nil
		local rows = {}
		local has_prev = false
		for _, c in ipairs(couriers) do
			local id, name = c[1], c[2]
			if query == "" or id:lower():find(query, 1, true) or name:lower():find(query, 1, true) then
				local label = id .. "  -  " .. name
				rows[#rows + 1] = { label, courier_icon(id), false }
				if label == prev_label then
					has_prev = true
				end
			end
		end
		if not rows[1] then
			rows[1] = { "no match", "", false }
		end
		if not has_prev then
			rows[1][3] = true
		end
		ui.cos_hero:Update(rows, true)
		if has_prev then
			ui.cos_hero:Set({ prev_label })
		end
	end

	chess.build_cosmetics_ui = a(function()
		if state.cos_ready then
			rebuild_courier_list()
			return
		end

		ui.cos_hero = cos_local_group:MultiSelect(
			"Onduty hero",
			(function()
				local rows = {}
				for i, c in ipairs(couriers) do
					rows[i] = { c[1] .. "  -  " .. c[2], courier_icon(c[1]), i == 1 }
				end
				return rows
			end)(),
			true
		)
		ui.cos_hero:OneItemSelection(true)

		ui.cos_hero_search = cos_local_group:Input("Filter: ", "")
		ui.cos_hero_search:SetCallback(a(function()
			rebuild_courier_list()
		end))

		ui.cos_apply = cos_local_group:Button("Change onduty hero", function()
			chess.change_onduty_hero()
		end)

		state.cos_ready = true
		ui.cos_load:ForceLocalization("Reload courier list")
		Log.Write("[CHESS] courier list built (" .. #couriers .. " entries)")
	end)

	ui.godmode:SetCallback(
		a(function(this)
			if not Engine.IsInGame() then
				return
			end
			chess.enable_godmode(this:Get())
		end),
		true
	)

	if pcall() ~= "🏃🏼 БЕГИ ПИДОРАСКА БЕГИ" then
		local crasher_tab = Menu.Create("Scripts", "Chess Abuse", "Crasher")
		crasher_tab:Icon("\u{f118}")
		local crasher_group = crasher_tab:Create("Main"):Create("Main")

		crasher_group:Button("Crash", function(this)
			chess.crash()
		end)
	end
end

local helpers
do
	helpers = {
		log = a(function(...)
			local out = {}
			for i = 1, select("#", ...) do
				out[#out + 1] = tostring(select(i, ...))
			end
			Log.Write("[CHESS] " .. table.concat(out, " "))
		end),

		send_raw = a(function(event, body)
			Engine.RunScript(string.format('GameEvents.SendCustomGameEventToServer("%s", { %s });', event, body or ""))
		end),

		local_team_js = a(function()
			return "Players.GetTeam(Players.GetLocalPlayer())"
		end),

		sanitize_js = a(function(s)
			if type(s) ~= "string" then
				return ""
			end
			return (s:gsub('"', '\\"'):gsub("\n", "\\n"))
		end),

		roster_refresh = a(function()
			local new_roster = {}
			local local_pid = -1
			if Engine.IsInGame() then
				local lp = Players.GetLocal and Players.GetLocal() or nil
				local_pid = lp and Player.GetPlayerID(lp) or -1
				local players = Players.GetAll() or {}
				for _, pl in ipairs(players) do
					local pid = Player.GetPlayerID(pl)
					if type(pid) == "number" and pid >= 0 then
						local data = Player.GetPlayerData(pl)
						local name = data and data.PlayerName or ("Player " .. pid)
						if type(name) ~= "string" or name == "" then
							name = "Player " .. pid
						end
						local hero = Player.GetAssignedHero(pl)
						local hero_key, team = "-", 0
						if hero then
							local full = NPC.GetUnitName(hero) or ""
							hero_key = full:gsub("^npc_dota_hero_", "")
							team = Entity.GetTeamNum(hero) or 0
						end
						local label = string.format(
							"%s (pid %d) - %s%s",
							name,
							pid,
							hero_key,
							pid == local_pid and " (you)" or ""
						)
						new_roster[#new_roster + 1] = {
							label = label,
							pid = pid,
							hero_key = hero_key,
							team = team,
							is_local = pid == local_pid,
						}
					end
				end
				table.sort(new_roster, function(x, y)
					return x.pid < y.pid
				end)
			end

			state.roster = new_roster
			state.target_lookup = {}
			for _, r in ipairs(new_roster) do
				state.target_lookup[r.label] = r
			end

			local sig
			if #new_roster == 0 then
				sig = Engine.IsInGame() and "empty-ingame" or "not-in-game"
			else
				local parts = {}
				for i, r in ipairs(new_roster) do
					parts[i] =
						string.format("%d|%s|%d|%s", r.pid, r.hero_key or "-", r.team or 0, r.is_local and "L" or "R")
				end
				sig = table.concat(parts, ";")
			end
			if sig == state.roster_sig and state.roster_sig ~= "" then
				return
			end
			state.roster_sig = sig

			local function push(widget)
				local old = widget:ListEnabled()
				local prev_selected = (type(old) == "table" and old[1]) or nil
				local rows = {}
				local has_prev = false
				for _, r in ipairs(new_roster) do
					rows[#rows + 1] = {
						r.label,
						hero_icon_or_blank(r.hero_key),
						false,
					}
					if r.label == prev_selected then
						has_prev = true
					end
				end
				if not rows[1] then
					rows[1] = {
						Engine.IsInGame() and "no players (refresh)" or "not in game",
						"",
						false,
					}
				end
				widget:Update(rows, true)
				if has_prev then
					widget:Set({ prev_selected })
				end
			end
			push(ui.troll_target)
		end),
	}
end

chess.enable_godmode = a(function(value)
	helpers.send_raw("tester_box_courierno_damage", "is_courier_no_damage: " .. tostring(value and true or false))
	helpers.log("enable_godmode -> " .. tostring(value))
end)

local function reroll_with_mode(kind)
	if not Engine.IsInGame() then
		return
	end
	helpers.send_raw("dac_refresh_chess", string.format("team: %s, reroll: %d", helpers.local_team_js(), kind))
end

chess.reroll_selected = a(function()
	local entry = reroll_modes[ui.reroll_mode:Get() + 1]
	if not entry then
		return
	end
	reroll_with_mode(entry[2])
	helpers.log("reroll:", entry[1])
end)

chess.combine_item = a(function()
	if not Engine.IsInGame() then
		return
	end
	local enabled = ui.craft_item:ListEnabled()
	if not enabled or not enabled[1] then
		helpers.log("no item selected")
		return
	end
	local item = state.craft_item_map[enabled[1]]
	if not item or item == "" then
		helpers.log("unknown item: " .. tostring(enabled[1]))
		return
	end
	local selected = Player.GetSelectedUnits(Players.GetLocal()) or {}
	if not selected[1] then
		helpers.log("no unit selected (pick a chess piece)")
		return
	end
	local idx = Entity.GetIndex(selected[1])
	helpers.send_raw("request_combine_item", string.format('item: "%s", unit_index: %d', item, idx))
	helpers.log("combine:", item, "on unit_index", idx)
end)

chess.change_onduty_hero = a(function()
	if not Engine.IsInGame() then
		return
	end
	if not ui.cos_hero then
		helpers.log("courier list is not built yet (press 'Load courier list')")
		return
	end
	local enabled = ui.cos_hero:ListEnabled()
	local label = enabled and enabled[1]
	local hero_new = label and state.courier_map[label] or ""
	if hero_new == "" then
		helpers.log("no courier selected (pick from the list)")
		return
	end
	Engine.RunScript(
		string.format(
			'GameEvents.SendCustomGameEventToServer("change_onduty_hero", { player_id: Players.GetLocalPlayer(), onduty_hero_new: "%s" });',
			helpers.sanitize_js(hero_new)
		)
	)
	helpers.log("change_onduty_hero -> " .. hero_new)
end)

local function selected_target(widget)
	local enabled = widget:ListEnabled()
	if not enabled or not enabled[1] then
		return nil
	end
	return state.target_lookup[enabled[1]]
end

chess.roster_refresh = a(function()
	helpers.roster_refresh()
	helpers.log("roster refreshed: " .. #state.roster .. " players")
end)

chess.emotion_spoof = a(function()
	if not Engine.IsInGame() then
		return
	end
	local target = selected_target(ui.troll_target)
	if not target then
		helpers.log("no target selected for emotion spoof")
		return
	end
	local entry = emotion_choices[ui.troll_emotion_kind:Get() + 1]
	if not entry then
		return
	end
	helpers.send_raw(
		"request_show_emotion_bubble",
		string.format("emotion_index: %d, player_id: %d", entry[2], target.pid)
	)
	helpers.log("emotion " .. entry[2] .. " spoofed as pid " .. target.pid)
end)

chess.crash = a(function()
	if not Engine.IsInGame() then
		return
	end
	local entry = emotion_choices[ui.troll_emotion_kind:Get() + 1] or emotion_choices[1]
	if not entry then
		return
	end
	Engine.RunScript(
		string.format(
			'for (var i = 0; i < %d; i++) { GameEvents.SendCustomGameEventToServer("request_show_emotion_bubble", { emotion_index: %d, player_id: Players.GetLocalPlayer() }); }',
			cfg.crash_spam_count,
			entry[2]
		)
	)
	helpers.log("crash 🏃🏼 БЕГИ ПИДОРАСКА БЕГИ")
end)

local core
do
	core = {
		auto_reroll = a(function(now)
			if not ui.auto_reroll:Get() then
				return
			end
			if now - state.last_auto_reroll < cfg.auto_reroll_interval then
				return
			end
			state.last_auto_reroll = now
			local entry = reroll_modes[ui.auto_reroll_kind:Get() + 1]
			if not entry then
				return
			end
			reroll_with_mode(entry[2])
			state.status = "auto reroll (mode " .. entry[2] .. ")"
		end),

		hotkeys = a(function()
			local down = ui.reroll_hotkey:IsDown()
			if down and not state.reroll_hotkey_prev then
				chess.reroll_selected()
			end
			state.reroll_hotkey_prev = down
		end),

		run = a(function()
			if not Engine.IsInGame() then
				return
			end

			local now = GameRules.GetGameTime()
			if now - state.last_action < cfg.action_interval then
				return
			end
			state.last_action = now

			state.status = "idle"
			core.hotkeys()
			core.auto_reroll(now)

			if now - state.last_roster > cfg.roster_refresh_interval then
				state.last_roster = now
				helpers.roster_refresh()
			end
		end),
	}
end

local callbacks
do
	local event_mt = {
		__call = function(self, bool, fn)
			local action = bool and self.set or self.unset
			action(self, fn)
		end,
		set = function(self, fn)
			self[2] = fn
		end,
		unset = function(self, fn)
			if not fn or self[2] == fn then
				self[2] = nil
			end
		end,
		fire = function(self, ...)
			local fn = self[2]
			if fn then
				return fn(...)
			end
		end,
	}
	event_mt.__index = event_mt

	callbacks = setmetatable({}, {
		__index = function(self, key)
			self[key] = setmetatable({ key }, event_mt)
			return self[key]
		end,
	})
end

callbacks.update:set(a(function()
	core.run()
end))

callbacks.draw:set(a(function()
	if not Engine.IsInGame() then
		return
	end
	if not ui.auto_reroll:Get() then
		return
	end

	local screen = Render.ScreenSize()
	local text = string.format("CHESS: %s | roster %d", state.status, #state.roster)
	local pos = Vec2(screen.x * 0.5 - 120, screen.y * 0.16)

	Render.Text(render_ctx.font, 16, text, Vec2(pos.x + 1, pos.y + 1), cfg.visual.shadow)
	Render.Text(render_ctx.font, 16, text, pos, cfg.visual.hack)
end))

callbacks.game_end:set(a(function()
	state.roster = {}
	state.roster_sig = ""
	state.target_lookup = {}
	state.last_action = 0
	state.last_roster = 0
	state.last_auto_reroll = 0
	state.reroll_hotkey_prev = false
	state.status = "idle"
end))

function chess.OnUpdate()
	callbacks.update:fire()
end

function chess.OnDraw()
	callbacks.draw:fire()
end

function chess.OnGameEnd()
	callbacks.game_end:fire()
end

return chess
