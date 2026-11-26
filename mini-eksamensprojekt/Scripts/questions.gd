extends Node

# spørgsmål, svar a b c d, skade
# 25 = godt svar  10 = ok  5 = dårligt
#(rigtige svar står først men det bliver blandet)

###morten
const level_1 = [
	["Hvorfor skal asylansøgere sendes til tredjelande i stedet for at få deres sag behandlet i Danmark?", "Det kan gøre det sværere for mennesker på flugt at få beskyttelse.", "Det giver alle flygtninge dansk statsborgerskab.", "Det løser automatisk integrationsproblemer.", "Det sikrer flere arbejdspladser.", [25, 5, 5, 10]],
	["Hvorfor skal udlændingepolitikken strammes så meget?", "Det kan holde mennesker ude, som kunne bidrage positivt til samfundet.", "Det sikrer, at alle får arbejde.", "Det fjerner behovet for integration.", "Det gør uddannelse gratis.", [25, 5, 5, 5]],
	["Hvorfor sænke skatter og afgifter, hvis vi også vil have bedre velfærd?",
		"Staten får færre penge til at betale for velfærden.", "Det gør hospitaler gratis at drive.", "Det giver automatisk flere sygeplejersker.", "Det fjerner behovet for offentlige skoler.",
		[25,5,5,5]],
	["Hvorfor fortsætte med olie og gas, når vi skal mindske CO₂-udledningen?", "Det kan forsinke overgangen til grøn energi.", "Det fjerner al forurening.", "Det gør Danmark CO₂-neutralt.", "Det sikrer billig grøn strøm.",[25, 5, 10, 10]],
	["Hvorfor begrænse Danmarks samarbejde med EU?", "Danmark kan miste indflydelse på fælles europæiske beslutninger.", "Danmark får automatisk mere handel.", "Det sikrer flere danske arbejdspladser.", "Det gør Danmark uafhængigt af alle andre lande.", [25, 5, 10, 5]],
]

#### løkke
const level_2 = [
	["Hvorfor sænke skatten, hvis det kan betyde færre penge til velfærd?",
		"Det kan gøre det sværere at finansiere skoler og hospitaler.", "Det sikrer bedre offentlig service.", "Det gør alle offentlige tilbud gratis.", "Det fjerner behovet for skat.",
		[25,10,5,5]],
	["Hvorfor skal virksomheder have lavere selskabsskat?", "Staten får færre skatteindtægter, som ellers kunne bruges på velfærd.", "Alle ansatte får automatisk højere løn.", "Det fjerner arbejdsløshed.", "Det sikrer, at alle virksomheder bliver danske.", [25, 5, 5, 5]],
	["Hvorfor gøre pensionssystemet mere fleksibelt?", "Det kan skabe større forskelle mellem dem, der har råd til at trække sig tilbage, og dem, der ikke har.", "Alle får automatisk samme pension.", "Det sikrer, at ingen skal arbejde.", "Det fjerner behovet for pension.",[25, 5, 5, 5]],
	["Hvorfor lade markedet spille en større rolle i velfærden?",
		"Det kan betyde, at økonomi får for stor betydning for kvaliteten af velfærden.", "Det sikrer gratis behandling til alle.", "Det fjerner forskellen mellem rig og fattig.", "Det gør alle offentlige tilbud bedre automatisk.",
		[25,5,5,5]],
	["Hvorfor gøre det lettere at hente arbejdskraft fra udlandet?", "Det kan øge konkurrencen om jobs og lægge pres på løn- og arbejdsvilkår.", "Det sikrer højere løn til alle.", "Det fjerner behovet for uddannelse i Danmark.", "Det løser automatisk alle problemer på arbejdsmarkedet.", [25, 5, 5, 5]],
]
####ALEX liberal
const level_3 = [
	["Hvorfor sænke skatten for de højeste indkomster?", "Det kan øge forskellen mellem dem med høje og lave indkomster.", "Det sikrer, at alle tjener det samme.", "Det giver automatisk bedre velfærd.", "Det gør uddannelse gratis.", [25, 5, 5, 5]],
	["Hvorfor skal staten blande sig mindre i virksomheder?",
		"Uden tilstrækkelige regler kan ansatte og forbrugere blive dårligere beskyttet.", "Det sikrer bedre arbejdsmiljø.", "Det fjerner alle monopolvirksomheder.", "Det giver staten mere kontrol.",
		[25,10,5,10]],
	["Hvorfor lade borgerne betale mere for private velfærdstilbud?", "Det kan skabe større forskel på dem, der har råd, og dem, der ikke har.", "Det sikrer samme behandling til alle.", "Det gør offentlige tilbud gratis.", "Det fjerner økonomisk ulighed.", [25, 5, 5, 5]],
	["Hvorfor fjerne regler for virksomheder?", "Regler beskytter blandt andet miljø, ansatte og forbrugere.", "Alle regler er unødvendige.", "Det gør virksomheder mindre effektive.", "Det sikrer automatisk lavere priser.", [25, 5, 10, 5]],
	["Hvorfor lægge så meget ansvar over på den enkelte?",
		"Det kan efterlade mennesker uden hjælp, når de ikke selv kan klare problemerne.", "Alle har altid de samme muligheder.", "Det fjerner behovet for social støtte.", "Det sikrer automatisk lighed.",
		[25,5,5,5]],
]


#### inger
const level_4 = [
	["Hvorfor skal flygtninge sendes hjem, når der igen er fred i deres hjemland?", "Det kan sende mennesker tilbage til lande, hvor situationen stadig er usikker.", "Det sikrer automatisk fred i landet.", "Det giver alle flygtninge arbejde.", "Det løser alle integrationsproblemer.",[25, 5, 5, 5]],
	["Hvorfor stille så strenge krav til udlændinge?", "Det kan gøre det sværere for mennesker at blive en del af samfundet.", "Det sikrer automatisk bedre integration.", "Det fjerner alle kulturelle forskelle.", "Det giver alle samme muligheder.", [25, 5, 5, 5]],
	["Hvorfor begrænse vindmøller og solceller på land?",
		"Det kan gøre det sværere at udbygge den grønne energi.", "Det fjerner behovet for grøn energi.", "Det sænker automatisk CO₂-udledningen.", "Det gør strømmen gratis.",
		[25,5,5,5]],
	["Hvorfor flytte statslige arbejdspladser ud af de store byer?", "Det kan blive dyrt og gøre det sværere at samle specialiserede medarbejdere.", "Det sikrer automatisk flere arbejdspladser.", "Det fjerner behovet for transport.", "Det gør alle kommuner lige store.", [25, 5, 5, 5]],
	["Hvorfor føre en meget stram udlændingepolitik?", "Danmark kan gå glip af arbejdskraft og mennesker, der kan bidrage til samfundet.", "Det sikrer, at alle virksomheder får flere ansatte.", "Det løser automatisk manglen på arbejdskraft.", "Det gør integration unødvendig.",[25, 5, 5, 5]],
]

####pelle
const level_5 = [
	["Hvorfor indføre formueskat på de rigeste?",
		"Det kan få nogle til at flytte formuer eller investeringer ud af Danmark.", "Det sikrer automatisk flere arbejdspladser.", "Det gør alle lige rige.", "Det fjerner behovet for andre skatter.",
		[25,5,5,5]],
	["Hvorfor sætte loft over huslejen?", "Det kan gøre det mindre attraktivt at bygge og udleje nye boliger.", "Det sikrer flere nye lejligheder.", "Det gør alle boliger gratis.", "Det fjerner boligmangel med det samme.", [25, 10, 5, 5]],
	["Hvorfor gøre tandlægen gratis for alle?", "Det kræver flere offentlige penge, som skal findes gennem skatter eller besparelser.", "Det gør sundhedsvæsenet gratis at drive.", "Det fjerner alle tandproblemer.", "Det giver automatisk flere tandlæger.", [25, 5, 5, 5]],
	["Hvorfor sænke momsen på mad?",
		"Det koster staten skatteindtægter, og lettelsen går også til folk, der ikke har brug for den.", "Det gør alle fødevarer gratis.", "Det fjerner al fattigdom.", "Det sikrer lavere priser på alle varer.",
		[25,5,5,5]],
	["Hvorfor bruge flere penge på offentlig transport?", "Det kan kræve højere skatter eller besparelser på andre områder.", "Det sikrer, at alle tager toget.", "Det fjerner behovet for veje.", "Det gør transport gratis uden omkostninger.", [25, 5, 5, 5]],
]

#### mette normal
const level_6 = [
	["Hvorfor stramme udlændingepolitikken så meget?", "Det kan ramme mennesker, der har brug for beskyttelse i Danmark.", "Det sikrer automatisk bedre integration.", "Det fjerner alle konflikter.", "Det skaber flere flygtninge.", [25, 5, 5, 10]],
	["Hvorfor hæve straffen for kriminalitet?",
		"Hårdere straffe løser ikke nødvendigvis årsagerne til kriminalitet.", "Det fjerner automatisk al kriminalitet.", "Det gør forebyggelse unødvendig.", "Det sikrer, at ingen begår kriminalitet igen.",
		[25,5,5,5]],
	["Hvorfor gennemføre reformer, der får flere til at arbejde?", "Det kan presse mennesker, der allerede har svært ved at klare arbejdsmarkedet.", "Alle kan uden problemer arbejde mere.", "Det fjerner behovet for hjælp til udsatte.", "Det sikrer automatisk højere løn.",[25, 5, 5, 5]],
	["Hvorfor bruge flere penge på militæret?", "Pengene kunne også bruges på velfærd, sundhed og uddannelse.", "Det gør alle offentlige tilbud gratis.", "Det fjerner alle trusler mod Danmark.", "Det løser automatisk manglen på sygeplejersker.", [25, 5, 5, 5]],
	["Hvorfor give skattelettelser, når velfærden har brug for penge?",
		"Det kan begrænse statens mulighed for at finansiere velfærden.", "Det giver automatisk flere penge til hospitalerne.", "Det gør skoler gratis at drive.", "Det fjerner behovet for offentlige ansatte.",
		[25,5,5,5]],
]



#### METTE FASE 2 (de svære)
const mette_phase_2 = [
	["Hvorfor bruge hjemsendelser som en vigtig del af udlændingepolitikken?", "Det kan skabe utryghed for mennesker, der har opbygget et liv i Danmark.", "Det sikrer, at alle flygtninge får statsborgerskab.", "Det løser automatisk konflikterne i hjemlandet.", "Det gør integration overflødig.", [25, 5, 5, 5]],
	["Hvorfor prioritere økonomiske reformer frem for mere offentlig støtte?", "Det kan øge presset på mennesker, der allerede er økonomisk udsatte.", "Alle får automatisk bedre økonomi.", "Det fjerner behovet for sociale ydelser.", "Det sikrer, at ingen bliver arbejdsløse.",[25, 5, 5, 5]],
	["Hvorfor lade pensionsalderen følge den stigende levealder?",
		"Ikke alle har samme helbred eller mulighed for at arbejde længere.", "Alle bliver automatisk sundere med alderen.", "Det sikrer samme pensionsvilkår for alle.", "Det fjerner forskellen mellem fysisk og stillesiddende arbejde.",
		[25,5,5,5]],
	["Hvorfor kan hårdere straffe ikke stå alene i kampen mod kriminalitet?", "Uden forebyggelse kan de bagvedliggende problemer fortsætte.", "Straf har aldrig nogen betydning.", "Alle kriminelle begår automatisk ny kriminalitet.", "Forebyggelse gør lovgivning unødvendig.", [25, 5, 5, 5]],
	["Hvorfor kan skattelettelser være et problem for velfærden?", "De kan mindske statens indtægter og gøre det sværere at finansiere offentlige tilbud.", "De betyder, at alle betaler mere i skat.", "De gør velfærden gratis.", "De sikrer flere offentlige ansatte.", [25, 5, 5, 10]],
	["Hvorfor er det problematisk at fokusere på økonomisk vækst frem for klima?",
		"Vækst kan øge ressourceforbrug og udledning, hvis den ikke bliver grøn.", "Økonomisk vækst skaber altid mindre CO₂.", "Klimaet påvirkes ikke af produktion.", "Grøn omstilling kræver ingen investeringer.",
		[25,5,5,5]],
	["Hvorfor kan en stram udlændingepolitik være en udfordring for virksomheder?", "Den kan begrænse adgangen til udenlandsk arbejdskraft.", "Den sikrer flere kvalificerede medarbejdere.", "Den fjerner behovet for arbejdskraft.", "Den gør alle virksomheder offentlige.", [25, 10, 5, 5]],
	["Hvorfor kan det være et problem at løse velfærdens udfordringer gennem reformer alene?", "Reformerne ændrer ikke nødvendigvis manglen på personale og ressourcer.", "Reformerne gør altid velfærden dårligere.", "Reformerne fjerner alle sociale problemer.", "Reformerne betyder, at staten ikke længere skal betale for velfærd.", [25, 5, 5, 5]],
	["Hvorfor kan øget militær oprustning være en svær prioritering?",
		"Flere penge til forsvaret betyder færre penge til andre formål, hvis budgettet er begrænset.", "Forsvaret har ingen betydning for sikkerheden.", "Militæret betaler automatisk for sundhedsvæsenet.", "Oprustning fjerner alle internationale konflikter.",
		[25,5,5,5]],
	["Hvorfor kan en regering, der både vil sænke skatter og øge offentlige udgifter, møde økonomiske udfordringer?", "Den skal finde finansiering, ellers kan det føre til underskud eller besparelser andre steder.", "Staten kan bruge ubegrænsede penge.", "Skattelettelser skaber altid større skatteindtægter.", "Offentlige udgifter påvirker ikke økonomien.",[25, 5, 5, 5]],
]

const all = [level_1,level_2,level_3, level_4, level_5,level_6] # alle levels
