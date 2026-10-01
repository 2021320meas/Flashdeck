-- Generated from Anki export. Run AFTER schema.sql.
insert into decks (name) values ('German Converstaion') on conflict (name) do nothing;
insert into decks (name) values ('German Grammar') on conflict (name) do nothing;
insert into decks (name) values ('German Words') on conflict (name) do nothing;

insert into cards (deck_id, front, back) select id, 'knapp sein
Z.B Das geld is knapp, deshalb konnen wir nicht Urlaub machen', 'Not enough' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Schlagzeilens
Z.B Der Skandal machte weltweit schlagzeilen.', 'Headlines' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Leistungen
Z.B Seine leistungen in der Schule sind sehr gut.', 'Performance / Achievement' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Umfrage
Z.B Laut einer umfrage sind viele Menschen mit der Regierung unzufrieden', 'Survey' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Zweck 
Z.B. Der Zweck dieses Treffens ist die Plannung des Projekts', 'Purpose' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Klagen
Z.B: Er klagt uber kopfschmerzen.', 'Complain' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'behaupten
Z.B: Er behauptet, dass er keine Zeit hatte. 
Z.B: Manche Leute behaupten, Kaffe sei ungesund.', 'Claim, Assert' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Zeitdruck
Z.B Ich arbeit besser ohne Zeitdruck', 'Time Pressure' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Bildunterschrift
Z.B Die Bildunterschrift erklärt, was auf dem Foto zu sehen ist.', 'Caption' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'werdegang
Z.B: Sein Werdegang zeigt, dass er viel Erfahrung in der IT-Branche hat.', 'Career Path' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bügeln
Z.B: Ich muss heute Abend noch meine Hemden bügeln.', 'Iron' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Recyclinganlagen', 'Recycling Facilities' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Verbieten + Dativ / Akkusativ ?', 'Mein strenger Vater verbietet dem ängstlichen Sohn heute ins Kino zu gehen.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Wir wollen von (die/den/dem) leute in Hannover wissen', 'den' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Aufwachsen Sein

Ich bin hier aufgewachsen', 'Grown up' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'hingezogen (Immer Partizip II)

Ich fulte mich zu Kunst hingezogen', 'Attracted to' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eine Vorstadt', 'Suburb' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'geboren sein

Ich bin in Phnom Penh geboren', 'Born in' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ebenfalls

Ich bin ebenfalls in Hannover geboren', 'also or as well' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Stimmt das ?', 'Is it correct ?
Is it true ?' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Weiterhin vs Weiter 

Ich wohne hier weiterhin.
Kannst du es weiter machen ?', 'Continuously (Remain Unchange ) vs Continue

I live here (currently living here and will continue living )
Can you continue to do that ? (Start doing that again)' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'hierher

Ich bin hierher nach Berlin gezogen.', 'Here

I moved here to Berlin (Speaking in Berlin)' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'hingezogen

Ich bin nach Berlin hingezogen', 'There

I move there to Berlin. (Fingerpointing to Berlin)' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Fur jeden ist etwas dabei

Ich finde, es ist fur jeden etwas dabei.', 'There''s something for everyone' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Viertel

Es ist die coolsten viertel', 'Districts' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Urspruenglich

Ich komme urspruenglich aus Kambodscha.', 'Originally

I come originally from Cambodia' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Rein nach bauchgefuehl

Ich habe einfach rein nach bauchgefuehl entschieden', 'Purely on Intuition

I decided based on pure intuition.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Rein nach zahlen

Ich habe rein nach Zahlen entscheiden.', 'Purely on numbers

I decided with purely numbers' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Reine Formscahe

Das ist reine Formsache', 'Just Formality

That is just formality.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eine ganze Weile

Ich studiere jetzt hier eine ganze Weile.', 'For quite a while

I study here for a while now.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Dabei Sein

1. Mitbringen

Ich habe mein Handys hier dabei. 
Ich habe meine Schlussel dabei

2. Teilnehmen

Ich bin dabei
Willst du dabei Sein ?

3. Der Process des Handelns (Dabei sein zu + Infinitive)

Ich bin dabei zu lernen.
Er ist dabei, das Essen zu kochen. 

4. inbegriffen / verfugbar

Fur jeden ist etwas dabei.
Bein Buffet war viel vegetarisches dabei.

5. Wahrend etwas machen

Ich habe Musik gehort und dabei gelernt.
Sie ist hingefallen und hat dabei ihr Handy kaputt gemacht.', '1. with you / carrying something

I have my phone with me.
I have my key with me.

2. Participating / Joining

I''m here.
Do you want to join ?

3. The process of doing something

I''m in the process of studying.
He''s cooking the food right now.

4. Included / Available 

There''s something for everyone.
There were many vegetarian options included.

5. While doing something

I listened to music while studying.
She fell and broke her phone in the process.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'inbegriffen

Das Fruhstuck ist im Preis inbegriffen
Strom und Internet sind in der Miete inbegriffen.', 'Included' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Primaer

Mein Primaeres Ziel ist es, Deutsch zu lernen.
Die Universitat konzentriet sich primaer auf Forschung.
Das Problem ist primaer finanziell.
Wir kommunizieren primaer auf Englisch.', 'Primarily' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einiges 

Hier gibt es doch einiges zu tun in der Natur.', 'Alot / Many' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Unterstufe
Mittelstufe
Oberstufe', 'Lower Grade ( 5 - 6 )
Middle Secondary Grade ( 7 - 9 )
Upper Secondary Grade ( 10 - 13 )' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Essenmoglichkeiten

Es gibt nich so viele Essenmoglichkeiten', 'Food options' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'laeden

Es gibt nur drei pizzalaeden.', 'Shop' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Altenheim

Sie arbeitet im Altenheim.', 'Retirement home or Nursing home' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ansonsten

Das Essen war gut, ansonsten war das Restaurant nich besonders.
Hast du noch Fragen? Ansonsten frage ich dich.
Wir konnen ins Kino gehen, ansonsten bleiben wir zuhause.', 'Otherwise' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'hauptsächlich

Ich spreche hauptsächlich Englisch im Alltag.
Das Restaurant besucht hauptsächlich Studenten.
Er hört hauptsächlich klassische Musik.
In Trier regnet es hauptsächlich im Winter.', 'Mostly' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'studienfach

Mein Studienfach ist Informatik.', 'Subject of study' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'pädagogik

Mein Bruder arbeitet im Bereich Pädagogik.
Gute Pädagogik ist für Kinder sehr wichtig.', 'education science / educational studies

My brother works in the field of education.
Good pedagogy is very important for children.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemandem ans Herz wachsen

Der Hund ist mir ans Herz gewachsen.
Trier ist mir ans Herz gewachsen.', 'To grow on something / someone emotionally

The dog has grown very dear to me.
I’ve become attached to the city of Trier.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wird

Ich werde müde.
Es wird kalt.
Er wird nervös.
Die Stadt wird größer.

Geworden sein ( Perfekt )
Es ist kalt geworden.
Die Stadt ist größer geworden.
Ich bin müde geworden.', 'To become' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'aufblühen

In Deutschland ist sie richtig aufgeblüht.
Kinder blühen auf, wenn sie Unterstützung bekommen.
Seit seinem neuen Job ist er total aufgeblüht.', 'to blossom' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'mehrere

Ich habe mehrere Freunde in Deutschland.
In Trier gibt es mehrere schöne Cafés.', 'Several

I have several friends in Germany.
There are several nice cafés in Trier.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'stadtteile

Dieser Stadtteil ist sehr modern.
In meinem Stadtteil gibt es viele Restaurants.', 'District 

This district is very modern.
There are many restaurants in my district.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Das Zentrale', 'The Central' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'übersichtlicher

Der kleine Stadtplan ist übersichtlicher für Touristen.
Mit dieser Tabelle ist alles übersichtlicher.', 'Easy to Navigate / Clearer

The small city map is clearer for tourists.
With this table, everything is more organized.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'fußläufig

Die Universität ist nur fünf Minuten fußläufig entfernt.
Der Supermarkt ist fußläufig erreichbar.
Ich suche eine Wohnung mit fußläufiger Anbindung zur Innenstadt.', 'Within walking distance' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Behindert

Mein Onkel ist körperlich behindert, aber sehr aktiv.
Die Universität bietet Unterstützung für behinderte Studierende an.', 'Disabled' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'machbar

Die Prüfung ist schwer, aber machbar.
Für mich ist ein Masterstudium in Deutschland machbar.
Der Weg zur Universität ist fußläufig machbar.', 'manageable / feasible' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Das ist mir schon aufgefallen.', 'I''ve noticed that too.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'sich wohlfühlen

Ich fühle mich hier wohl.', 'Feel comfortable' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'sich anschließen an

Nach dem Vortrag schließt sich eine Diskussion an.
Direkt daran schließt sich ein Park an.
An die Stadt schließt sich ein Wald an.', 'to connect to / to follow / to adjoin' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Naturlandschaft', 'Natural Landscape' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'radeln

Er radelt jeden Morgen zur Universität.
Meine Freundin radelt gern durch die Stadt.
Im Sommer radeln viele Leute an der Mosel entlang.', 'Ride bicycle' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'dorflich', 'Rural Area' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'insbesondere

Ich interessiere mich insbesondere für künstliche Intelligenz.
Besonders Studenten profitieren insbesondere von diesem Angebot.', 'Especially / Particularly / In particular' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'überzogen

Seine Reaktion war völlig überzogen.
Die Kritik klingt etwas überzogen.', 'Exaggerated' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'überzogen

Der Kuchen ist mit Schokolade überzogen.
Die Straßen waren mit Schnee überzogen.', 'Cover with' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zugänglich

Die Bibliothek ist für alle Studenten zugänglich.
Die Informationen sind online frei zugänglich.', 'Accessible' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ausweichen auf + Akkusativ

Viele Studenten weichen auf kleinere Städte aus.
Wenn das Restaurant voll ist, weichen wir auf ein Café aus.', 'to switch to an alternative
to fall back on something else' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ausweichen

Das Auto wich plötzlich aus.
Er wich meinem Blick aus.
Sie wich der Frage aus.
Der Hund wich zurück.', 'dodge / avoid

He avoide my gaze
She avoid my questions' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'weltoffen

sie ist sehr weltoffen', 'Open-minded' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'teilweise

Der Text ist teilweise schwer zu verstehen.
Ich stimme dir teilweise zu.', 'Partly' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'engstirnig

Sie ist engstirnig', 'Narrow-minded' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'lockere

Wir haben eine lockere Atmosphäre im Unterricht.
Er hat eine lockere Art (here meant way) zu sprechen.', 'relax' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'mittlerweile

Mittlerweile spreche ich besser Deutsch.
Er wohnt mittlerweile in Berlin.
Die Stadt ist mittlerweile sehr modern geworden.', 'In the meantime, by now, now, meanwhile' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Anlauftstelle

Das Bürgeramt ist eine wichtige Anlaufstelle für neue Einwohner.
Das Jugendzentrum dient als Anlaufstelle für Jugendliche', 'anlaufen = to approach/go to
Stelle = place/position' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einbrechen

Die Polizei untersucht, wie der Dieb eingebrochen ist.
Letzte Nacht wurde in das Geschäft eingebrochen.', 'Break into (burglarize)' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einbrechen

Die Verkaufszahlen sind stark eingebrochen.
Im Winter ist der Tourismus eingebrochen.', 'Collapse / Drop Suddenly' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ausstellungen', 'Exhibitions' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Forderung', 'Funding' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'etwas zur Verfügung stellen

Die Universität stellt kostenlose Kurse zur Verfügung.', 'to provide something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Spiezell

Dieses Buch ist speziell für Anfänger geeignet.
Ich interessiere mich speziell für künstliche Intelligenz.
Gibt es etwas Spezielles zu essen?
Der Kurs richtet sich speziell an internationale Studierende.', 'specifically' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich eignen fur + Akkusativ

Dieses Buch eignet sich für Anfänger.
Die Wohnung eignet sich gut für Studenten.
Der Park eignet sich perfekt zum Joggen.
Dieses Thema eignet sich gut für eine Präsentation.', 'Suit for' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Riesen

Ich habe einen Riesenhunger.
Das war ein Riesenerfolg für das Team.
Ich habe einen Riesenhunger.
Zwischen den beiden Städten gibt es einen Riesenunterschied.', 'Huge' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eingestellt

Die Firma hat neue Mitarbeiter eingestellt.(1)
Ich habe den Wecker auf 7 Uhr eingestellt. (2)
Das Produkt wurde eingestellt. (3)
Er ist sehr positiv eingestellt. (4)', 'Hire
Set / Adjust
Discontinue
He has a positive attitude' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'angeblich

Er ist angeblich sehr reich.
Angeblich kommt morgen ein Sturm.
Sie hat angeblich in Berlin studiert.', 'Supposedly' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wonach suchst du denn ?', 'What are you looking for ?' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'wesentlich

Die Universität spielt eine wesentliche Rolle in der Forschung.
Es gibt keine wesentlichen Unterschiede zwischen den beiden Methoden.', 'Essential
Significant' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'von der Größe her

Der Campus ist von der Größe nicht zu groß.
Berlin ist mir von der Größe zu stressig.', 'In terms of size' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'überschaubar

Die Aufgabe ist überschaubar.', 'Manageable' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Der Rummel', 'Amusement Area / Festival' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bummeln

Wir bummeln durch die Stadt.
Am Sonntag bummle ich gern an der Mosel entlang.
Sie sind gemütlich durch die Altstadt gebummelt.', 'Stroll around / Shop around slowly' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Programmpunkte

Was ist Ihre Programmpukte ?', 'Agenda' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'glassern fahrstuhl', 'Glass elevator' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'beziehungweise (bzw)

Informatik beziehungsweise künstliche Intelligenz interessiert mich besonders.
Wir treffen uns in Trier beziehungsweise online.', 'More precisely' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Trainingslager', 'Training Camps' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zufällig

Hast du zufällig einen Stift dabei?
Wir haben uns zufällig in Trier getroffen.
Ich habe ihn zufällig im Supermarkt gesehen.', 'Accidentally' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'tapfer

du bist sehr tapfer', 'brave' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sein + gewesen

Ich bin im Krankenhaus gewesen', 'Same as ( war )' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'dekoartikel

In dem Laden gibt es viele schöne Dekoartikel.
Zu Weihnachten kaufen viele Leute neue Dekoartikel.
Die Wohnung ist mit modernen Dekoartikeln eingerichtet.', 'decoration items' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'ofen', 'oven' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'schieben

Er hat den Tisch zur Seite geschoben.
Ich habe die Tür langsam aufgeschoben.
Das Meeting wurde auf morgen geschoben (2)', 'pushed / postpone' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'verschiben

Wir mussten das Meeting auf nächste Woche verschieben.
Wegen des Regens wurde das Spiel verschoben.', 'Delay' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'aufschieben

Ich darf meine Hausaufgaben nicht länger aufschieben.
Viele Studenten schieben ihre Arbeit bis zur letzten Minute auf.', 'Procrasinate' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'etwas vor sich herschieben

Ich schiebe meine Hausarbeit schon seit Wochen vor mir her.
Er schiebt wichtige Entscheidungen immer vor sich her.
Viele Leute schieben den Arztbesuch vor sich her.
Hör auf, deine Probleme vor dir herzuschieben.', 'vor sich her = in front of oneself
schiben = push
> pushing something ahead of you instead of dealing with it' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Rechtwissenschaft', 'Law Major' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Anwahl', 'lawyer' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Gewalt', 'Violence' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Anliegen

Ich habe ein wichtiges Anliegen.
Die Mitarbeiter kümmern sich um Ihr Anliegen.
Die Mitarbeiter kümmern sich um Ihr Anliegen.', 'Concerns' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Vertriebssytem

Das Unternehmen hat ein modernes Vertriebssystem entwickelt. (1)
Ein gutes Vertriebssystem ist für den Erfolg sehr wichtig. (2)
Viele Produkte werden über ein digitales Vertriebssystem verkauft. (2)', '1. Distributed System
2. Sales System' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'auessert

Wer auessert eine Vermutung ?', 'Express impression' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Briefmarken', 'Stamps' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'annehmen

Ich nehme an, dass er seine Ruhe haben will.', 'I assume' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'klettern

Ich klettere am Wochenende gern mit meinen Freunden in den Bergen.', 'Clime' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'mutig 

Er ist sehr mutig', 'Tapfer' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Modelleisenbahn', 'Modell = Model / Miniature
Eisenbahn = Railway station / Train system' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'An einem Freien Tag mache Ich Kuche.', 'On holiday, I make a cake.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich erhole

An einem freien Tag erhole Ich mich von der letzten Party', 'Recover' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Erstellen

Ich habe gestern ein neues Dokument erstellt.', 'Create' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eigen (adj)

Erstellen Sie ein eigenes Profil.', 'Own' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufhängen

Ich hänge ein Bild an die Wand auf.', 'Hang' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'annehmen

Ich nehme an, dass Kambodscha in Südostasien liegt.', 'Ich glaube ...' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zupassen

Dieser Beruf passt gut zu meinen Interessen.
Die Farbe Rot passt nicht zu diesem Zimmer.', 'fit / suit' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zupassen

Wenn sich eine Gelegenheit bietet, musst du zupassen.', 'Take advantages of one opportunity / seize the opportunity' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Irgendwie

Irgendwie finde ich diese Aufgabe schwierig.
Wir werden das Problem irgendwie lösen.
Er sieht heute irgendwie müde aus.
Irgendwie habe ich meinen Schlüssel verloren.

Die Geschichte ist irgendwie interessant.', 'Somehow' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Gedanken

Kannst du deine Gedanken mit uns teilen?
Nach der Prüfung hatte ich gemischte Gedanken.', 'Thoughts' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ausdrücken

Was drückt hier der Konjunktiv II aus?', 'Express' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ausdruken

Ich drucke das Dokument aus.', 'Print out' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ausfüllen

Bitte füllen Sie dieses Formular aus.
Ich habe den Antrag schon ausgefüllt.
Kannst du das Dokument ausfüllen?', 'Complete / fill out' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ausfallen

Der Unterricht fällt heute aus.
Mein Zug ist ausgefallen.
Der Strom ist ausgefallen.
Wegen Krankheit fällt er aus.', 'Cancel / Absent' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'umformulieren

Kannst du diesen Satz umformulieren?
Der Lehrer hat den Text einfacher umformuliert.
Ich muss meine Antwort noch umformulieren.', 'Rephrase' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'möglichst

Komm möglichst früh.
Schreib möglichst deutlich.
Lerne möglichst viele Wörter.
Antworte möglichst schnell.', 'as ... as possible' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'herum

Die Kinder laufen im Garten herum.
Ein Hund läuft auf der Straße herum.

Ich schaue im Geschäft herum.

Wir sind den ganzen Nachmittag in der Stadt herumgelaufen.', 'Around' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jeweils (immer mit s am endung)

Die Studenten bekommen jeweils ein Buch.
Schreiben Sie jeweils einen Satz.
Die Kinder bekamen jeweils ein Eis.', 'Each' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Laut (satzanfang)

Laut dem Arzt bin ich gesund.
Laut Wetterbericht regnet es morgen.
Laut meiner Mutter soll ich mehr lernen.', 'According to' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'die 1950er Jahre (Plural)

In den 1950er Jahre habe Ich als Friseur gearbeitet.', 'The 1950s' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gehören zu + ( dativ / akkusativ )
Das Buch gehört zu meiner Sammlung.
Dieses Lied gehörte zu den beliebtesten Liedern der 1950er-Jahre.', 'Dativ' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'von etwas haben

A: I habe viel geld, B: Ich habe auch davon', 'von' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'klagen über + akkusativ

Er klagt über das schlechte Wetter.
Die Studenten klagen über die schwere Prüfung.
Viele Menschen klagen über zu wenig Freizeit.', 'Complain about' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Es geht darum

Es geht darum, Deutsch zu lernen.
Es geht darum, fitter zu werden.', 'It''s about ...' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'nähen

Meine Mutter näht ein Kleid.
Ich nähe einen Knopf an meine Jacke.
Sie näht gern in ihrer Freizeit.', 'Sew' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'auf eine Art/Weise

Er erklärt die Grammatik auf eine einfache Art.

Sie hat auf eine freundliche Art geantwortet.

Er hat das Problem auf eine kreative Art gelöst.

Auf dieselbe Weise habe ich Deutsch gelernt.', 'in a way' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Vorgang / Verfahren

Wiederholen Sie den Vorgang noch einmal. (Wiederholen = repeat)
Der Vorgang dauert nur wenige Minuten.
Lesen Sie den Text und wiederholen Sie den Vorgang mit dem nächsten Text.
Der Installationsvorgang ist fehlgeschlagen.
Wir müssen das Verfahren wiederholen.', 'Process / Procedure' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'sich einigen auf + Akkusativ

Die beiden Parteien konnten sich nicht einigen.
Ich einige mich mit meinem Bruder.
Wir haben uns auf einen Termin geeinigt.', 'Agreement with' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Bilden 

Bilden Sie Gruppen zu dritt.
Bilden Sie eine Gruppe mit Ihren Nachbarn.
Die Studenten bilden kleine Gruppen.', 'Form' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Notieren zu + dativ

Notieren Sie zu jedem Bild einen Satz.', 'Write down for each ..' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'vortragen

Eine Person der Gruppe A trägt das erste Argument vor.
Der Student trägt sein Argument vor.
Sie trägt einen Vortrag (Presentation) über Deutschland vor.', 'Present / put forward / deliver' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gewesen zu sein

Er behauptet, selbst da gewesen zu sein.
Sie sagt, selbst dabei gewesen zu sein.
Ohne selbst da gewesen zu sein, kann man das schwer beurteilen.
Sie glaubt, recht gehabt zu haben.', 'It has the same meaning as war or waren. Since we cant use war with zu, we instead put gewesen zu sein. But the meaning is the same' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Betriff

Dieses Problem betrifft viele Menschen.
Das betrifft die frage, wie man dort hinkommt', 'Concerns 

Note: Was ... betriff = As far as ... Concerned:

Was Deutsch betrifft, muss ich noch viel lernen.
Was die Prüfung betrifft, bin ich etwas nervös.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Denen (Relativpronomen)

Die Häuser, in denen ich wohne, sind alt. (Plural + Dativ)

Die Länder, in denen Deutsch gesprochen wird, liegen in Europa.', 'Denen will be only seen with relative pronomen sentence as shown above along with dativ and plural.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'leben + auf + insel

Ich lebe auf Mallorca.
Wir leben auf einen schonen insel.', 'leben auf + islands' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Stiegen + sein

Die Mieten sind in den letzen Jahren stark gestiegen.', 'Increase (plus with sein)' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Redakteur/in', 'Editors' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ist geworden

Er ist müde geworden.
Das Wetter ist besser geworden.
Trier ist im Sommer lebendiger geworden.', 'Became (Past of become)' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Einsam

Erik mochte lange Roadtrips und Trekkingtouren durch die ganze Welt noch nie, weil es auf den Reisen viel zu einsam ist.', 'Lonely' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sonnenaufgang und sonnenuntergang', 'Sunrise and Sunset' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Zelten

Ich zelte auf dem balkon', 'Camping' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Flach

Der See ist hier sehr flach.
Dieser Teller ist flach.
Die Landschaft in Norddeutschland ist sehr flach.', 'Shallow / Flat' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wasserdicht 

Ich brauche wasserdichte Schuhe für die Wanderung.

Das Zelt ist komplett wasserdicht.', 'Waterproof' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'müllbeutel', 'garbage bag' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Video drehen

Ich drehe ein Video für YouTube.
Die Studenten drehen ein Video für ihr Projekt.', 'Shoot video' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'am häufigsten', 'Ich fahre am häufigsten mit dem Fahrrad zur Universität.
Deutsch und Englisch sind die am häufigsten gesprochenen Sprachen in meiner Klasse.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Beiträge

Ich habe deinen Beitrag gelesen.
Vielen Dank für deinen Beitrag zur Diskussion.', 'Post (Ex. Facebook posts)' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Beiträge

Der monatliche Beitrag beträgt 20 Euro.
Die Krankenkassenbeiträge sind gestiegen.', 'Fee / Payment' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Die häufigsten grund für ... sind vielleicht ...
An zweiter / dritter / ... Stelle ist vermutlich', 'The most frequent reason ist
Second, third place is ...' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Mich überrascht, dass ...
Es wundert mich, dass ...
Ich bin erstaunt, dass ...', 'It surprise me, that ...' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Nachwuchs

Der Fußballverein sucht dringend Nachwuchs für seine Jugendmannschaften.
Im Handwerk fehlt der Nachwuchs.

Viele Unternehmen investieren in den Nachwuchs.', 'sportlicher Nachwuchs = young athletes 
wissenschaftlicher Nachwuchs = young researchers 
ärztlicher Nachwuchs = young doctors 
Nachwuchs fehlt = there aren''t enough new people entering the field' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Nach + Dative

Ich bleibe nach dem medizinstudium lieber in der stadt.
Elf Jahre nach ihrem Studium zieht sie in ihren Heimatort zuruck.', 'After' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'übernehmen + Akkusativ

Kannst du morgen meine Schicht übernehmen?
Ich übernehme die Kosten für das Abendessen.
Sie übernimmt die Verantwortung für das Projekt.', 'Take over / Cover (fee)' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Untersuchen + akkusativ

Der Arzt untersucht den Patienten. (1)
Die Ärztin hat mich gestern untersucht. (1)
Der Hausarzt untersucht die Patientin gründlich. (1)
Die Polizei untersucht den Unfall. (2)
Die Wissenschaftler untersuchen die Auswirkungen des Klimawandels. (3)
Der Techniker untersucht den Computer auf Fehler. (4)', '1. Examine
2. Investigate 
3. Studying 
4. Inspects' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Auswirkungen

Der Klimawandel hat große Auswirkungen auf die Umwelt.
Die Entscheidung hatte negative Auswirkungen auf das Unternehmen.', 'Effects' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'an ... studieren', 'sie hat an der Technische Institut studiert.' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'allmählich

Meine Deutschkenntnisse verbessern sich allmählich.
Allmählich verstehe ich die deutsche Grammatik besser.', 'Gradually' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'ohnehin

Ich habe ohnehin keine Zeit.
Wir wollten ohnehin nach Hause gehen.
Du brauchst dich nicht zu entschuldigen, ich habe es ohnehin verstanden.', 'anyway' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'verlassen + akkusativ

Ich verlasse das Haus um 8 Uhr.
Der Student verlässt die Universität nach dem Unterricht.', 'Leave' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich verlassen auf = to rely on, depend on

Ich verlasse mich auf meinen Freund.
Wir verlassen uns auf die Informationen des Arztes.
Die Patientin verlässt sich auf ihren Hausarzt.', 'Rely on, Depend on' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Beihilfe

Der Staat gewährt Beihilfen für Studierende. (Grants)
Landwirte erhalten Beihilfen von der EU. (Receive)', 'Support' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Erhalten

Landwirte erhalten Beihilfen von der EU. (Farmers)', 'Receive' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'hinter sich zu lassen

Wir ließen die Stadt hinter uns und fuhren aufs Land.

Nach dem Studium möchte ich die Prüfungen endlich hinter mir lassen.', 'Leave behind' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gebraucht werden

Jeder Mensch möchte das Gefühl haben, gebraucht zu werden.
Nach seiner Pensionierung vermisste er es, gebraucht zu werden.
Viele Freiwillige engagieren sich, weil sie das Gefühl mögen, gebraucht zu werden', 'to be needed' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gewöhnt / an ... gewöhnt

Ich bin an das deutsche Wetter gewöhnt.
Wir sind an den Lärm der Stadt gewöhnt.', 'Used to ...' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'begegnen

Ich bin gestern meinem Professor begegnet.
Auf dem Weg zur Universität bin ich einer alten Freundin begegnet.', 'Meet' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'unbesetz

Die Wohnung ist noch unbesetzt.
Der Platz neben mir ist unbesetzt.', 'unoccupy / vacant / unfilled' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Betreuung 

Die Betreuung meiner Masterarbeit ist sehr gut.
Wer übernimmt die Betreuung der Studierenden?
Der Professor betreut meine Masterarbeit.
Die Erzieherin betreut die Kinder.', 'Supervision / Supervises' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'rund um die Uhr

Das Krankenhaus ist rund um die Uhr geöffnet.
Der Kundendienst ist rund um die Uhr erreichbar.
Die Polizei arbeitet rund um die Uhr.', '24 / 7' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Die Zeilen

In den letzten Zeilen des Artikels steht die wichtigste Information.
Der Programmierfehler befindet sich in den ersten zehn Zeilen des Codes.
Diese Zeile Code verursacht einen Fehler.
Die CSV-Datei enthält 10.000 Zeilen.', 'The lines' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'angesprochen werden

Ich wurde auf der Straße von einem Touristen angesprochen. (1)
Das Problem wurde in der Besprechung (meeting) angesprochen. (2)
Ich möchte nicht vor der ganzen Gruppe angesprochen werden. (3)
Wichtige Fragen werden im Seminar angesprochen. (4)', '1. Being approached by someone
2. A topic being discussed
3. Being addressed personally
4. Discussed' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'festen beziehung

Seit drei Jahren bin ich in einer festen Beziehung.
Er sucht keine lockeren Bekanntschaften, sondern eine feste Beziehung. 
Meine Schwester führt eine feste Beziehung mit ihrem Studienkollegen.
Trotz der Entfernung haben sie eine feste Beziehung aufgebaut.', 'Serious relationship' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Kissen', 'Pillows' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'wäsche aufgehängt

Ich habe heute Morgen die Wäsche aufgehängt.
Nachdem sie die Wäsche gewaschen hatte, hat sie sie auf dem Balkon aufgehängt.', 'Hung the laundry' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'herumliegen

Überall im Zimmer liegen Bücher herum.
Lass deine Kleidung nicht auf dem Boden herumliegen.
In der Küche lagen noch schmutzige Teller herum.', 'To lie around' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Haushalt

In unserem Haushalt leben drei Personen.
Wegen meines Studiums habe ich wenig Zeit für den Haushalt.', 'Household' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Tätigkeiten

Die Tätigkeiten eines Lehrers sind sehr vielfältig.
Neben dem Studium habe ich noch viele andere Tätigkeiten.
Während meines Praktikums habe ich verschiedene Tätigkeiten im Büro übernommen.', 'Activities / Tasks' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Den Boden Wischen

Jeden Samstag wische ich den Boden in meiner Wohnung.
Nachdem die Kinder gespielt hatten, musste ich den Boden wischen.
Der Boden ist schmutzig, deshalb werde ich ihn heute Abend wischen.', 'Mop the floor' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wegbringen

Wenn der Mülleimer voll ist, sollte man den Müll sofort wegbringen.
Nachdem wir gekocht hatten, brachte ich den Müll weg.', 'Take out' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'spülmaschine einräumen / ausräumen

Nach dem Abendessen räume ich die Spülmaschine ein.
Kannst du bitte die Spülmaschine einräumen, während ich den Tisch abräume?', 'Load the dishes / unload the dishes from the machine' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'staubsauge

Ich staubsauge meine Wohnung einmal pro Woche.
Bevor die Gäste kommen, sollten wir noch staubsaugen.', 'Vaccum' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'merkwürdig

Das ist wirklich merkwürdig.
Ich habe gestern ein merkwürdiges Geräusch gehört.
Es ist merkwürdig, dass er noch nicht geantwortet hat.', 'Strange, Odd, Unusual' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Entstehen

Durch das Gespräch ist eine gute Idee entstanden. (1)
Bei dem Unfall ist großer Schaden entstanden. (2)
Zwischen den beiden Studenten ist eine enge Freundschaft entstanden. (3)', '1. Arise
2. Occur
3. Created' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ernsthaft

Er denkt ernsthaft darüber nach, nach Deutschland zu ziehen.
Wenn du Deutsch lernen möchtest, musst du ernsthaft üben.
Sie hat die Frage ernsthaft beantwortet.', 'seriously, sincerely, genuinely' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Erst vor Kurzem

Ich bin erst vor Kurzem nach Deutschland gekommen.
Wir haben uns erst vor Kurzem kennengelernt.', 'Recently' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bewusst (adverb) \ sich + Dativ + bewusst sein + Genitiv (adjectiv)

Ich bin mir der Risiken bewusst. (1)
Sie ernährt sich bewusst und achtet auf ihre Gesundheit. (2)
Er hat bewusst auf Alkohol verzichtet. (3)', '1. Aware 
2. Consciously
3. Deliberately' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'rücksicht (nehmen) auf + akkusativ
rücksicht (zeigen) gegenüber + dativ

Sie zeigt immer Rücksicht gegenüber älteren Menschen. 
Gegenseitige Rücksicht ist wichtig für ein gutes Zusammenleben.
Bitte nimm Rücksicht auf deine Nachbarn und sei nachts nicht zu laut.', 'To be considerate of' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Lebensumstände

Die Lebensumstände haben sich in den letzten Jahren stark verändert.
Jeder Mensch hat unterschiedliche Lebensumstände.
Trotz schwieriger Lebensumstände hat sie ihr Studium erfolgreich abgeschlossen.
Dank des DAAD-Stipendiums sind meine finanziellen Lebensumstände während des Studiums gesichert.', 'Living circumstances / conditions' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ankommen auf + auf

Die Entscheidung kommt auf das Geld an.
Es kommt auf die Person an.
Ob man zusammenzieht, kommt auf die Lebensumstände an.', 'Depend on' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemandem / etwas ähnlich sein

Du siehst deinem Bruder sehr ähnlich
Meine Erfahrungen sind deinen sehr ähnlich.
Die beiden Häuser sind sich erstaunlich ähnlich.', 'similar' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich gut verstehen

Obwohl er und meine Tochter sich gut verstehen, möchte ich das im Moment aber nicht.
vielleicht in zwei, drei Jahren, wenn meine Tochter aus dem Haus ist.', 'Get along well' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'anlogen

Er hat seine Eltern angelogen.
Ich habe nie über mein Alter gelogen.
Aussagen sind Wahr, eine ist gelogen.', 'Lied' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'schaubild', 'graph, diagram and chart' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einsamkeit

Viele ältere Menschen leiden unter Einsamkeit.
Die Einsamkeit auf dem Land kann für manche Menschen ein Problem sein.
Nach seinem Umzug in eine neue Stadt fühlte er große Einsamkeit.', 'Loneliness' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'schlecter internetempfang', 'bad internet connection' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Mir hat gefehlt, dass

Mir hat gefehlt, dass meine Familie in der Nähe war.
Mir hat gefehlt, dass wir mehr Zeit miteinander verbringen konnten.
Mir hat gefehlt, dass niemand mit mir Deutsch gesprochen hat.', 'What I missed was that ...' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'Für mich gehört ... auch eher zu ...

Für mich gehört Tennis auch eher zu den Einzelsportarten.
Für mich gehört Trier auch eher zu einer kleinen Stadt.
Für mich gehört ein Laptop auch eher zu den wichtigen Arbeitsmitteln.', 'In my opinion, ... is more of a ...' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'Zweifeln

Ich zweifle an seiner Ehrlichkeit.
Viele Menschen zweifeln an dieser Theorie.
Sie zweifelt an ihrer Entscheidung.
Nach dem Fehler begann er an sich selbst zu zweifeln.', 'Doubt' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'Abbruch

- Studienabbruch → dropping out of university 
- Abbruch eines Gesprächs → termination of a conversation 
- Abbruch eines Projekts → cancellation of a project 
- Abbruch eines Gebäudes → demolition of a building', 'Termination' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'Aussteigen

Rund 30 Prozent der Studierenden steigen vor dem Bachelorabschluss aus.', 'Drop out' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'abzubrechen

Das Studium abzubrechen ist nicht das Ende.
Wir mussten das Gespräch abbrechen.', 'discontinue' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bisherigen

Ich bin mit meinen bisherigen Ergebnissen zufrieden.
Seine bisherigen Erfahrungen helfen ihm im neuen Job.', 'previous, so far' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'anschließend

Ich habe meine Hausaufgaben gemacht und anschließend einen Film gesehen.
Zuerst hatte ich Deutschunterricht, anschließend bin ich in die Bibliothek gegangen.', 'afterwards' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wo genau liegen denn die Probleme ?', 'What is the problem ?' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'ander als ...

Das Wetter ist anders, als ich erwartet habe.
Deutschland ist anders, als ich es mir vorgestellt habe.', 'Different from ...' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Beton', 'Concrete / Cement' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'stahl', 'Steel' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Klausuren', 'Exams' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Zeichnen

Ich zeichne gerne Landschaften und Tiere.
Meine Schwester kann sehr gut zeichnen.
Im Kunstunterricht haben wir ein Haus gezeichnet.', 'Draw' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'beziehungweise

Ich studiere Informatik beziehungsweise Data Science. (1)
Wir treffen uns am Wochenende, beziehungsweise am Samstag. (2)', '1. Rather
2. Or more specifically' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'beziehungsweise

Anna und Max sind 22 beziehungsweise 24 Jahre alt. (1)
Die Tickets kosten 10 beziehungsweise 15 Euro. (1)
Bitte senden Sie Ihren Reisepass beziehungsweise Ihren Personalausweis. (2)', '1. respectively
2. Or' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Umfeld

Ein gutes Umfeld ist wichtig für den Lernerfolg.
Ich möchte in einem internationalen Umfeld arbeiten.', 'Environment' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Betrieb

In diesem Betrieb arbeiten mehr als 200 Personen. (1)
Wegen eines technischen Problems wurde der Betrieb der Maschine gestoppt. (2)
Der Zugbetrieb wurde wegen des Unwetters unterbrochen. (2)

In unserem Betrieb herrscht eine freundliche Atmosphäre. (3)', '1. Company 
2. Operation
3. Workplace' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Tante', 'Aunts' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Sich verbeugen

Der Schauspieler verbeugte sich vor dem Publikum.
In Japan verbeugen sich viele Menschen zur Begrüßung.
Er verbeugte sich höflich vor der Königin.', 'Bow' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Falls

Falls es regnet, bleibe ich zu Hause.
Falls du Hilfe brauchst, ruf mich an.', 'Fall immer mit s here' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'etwas halten von 

Was hältst du von diesem Film?
Ich halte viel von diesem Vorschlag.', 'Think of something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Aushang', 'Annoucement' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'überfliegen

Ich habe den Artikel nur kurz überflogen.
Bevor ich das Formular unterschrieben habe, habe ich es schnell überflogen.
Der Professor hat die Hausarbeit überflogen und einige Fehler gefunden.', 'Skim through' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Bauernhof', 'Farm' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'lokale währung', 'local currency' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Handlungsorte

Die Handlungsorte des Romans sind Berlin und Hamburg.
In diesem Film wechseln die Handlungsorte sehr oft.', 'settings / location where events take place' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'etwas weckt mein Interesse

Das hat mein interesse geweckt.
Das Thema künstliche Intelligenz hat mein Interesse geweckt.', 'something sparks my interest' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'spuren

Im Schnee waren viele Spuren zu sehen.
Touristen sollten möglichst wenige Spuren in der Natur hinterlassen.
Beim Wandern hinterlassen wir keinen Müll und keine Spuren.', 'traces, footprint' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ganz so neu ist die Slow-Idee allerdings nicht.', 'However, the slow idea is not quite that new.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ist seit einigen Jahren der neue Reise-Trend', 'has been a popular travel trend for several years now.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'erscheinen + sein

Das Buch ist 2025 erschienen.
Der Artikel ist in einer bekannten Zeitschrift erschienen.
Der Forschungsartikel ist erst vor kurzem erschienen.', 'Publish / appear' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eines Tagen

Z.B Vielleicht gehen wir eines Tagen nach Trier.', 'Some days' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'übertrieben (v)

Er hat eine übertriebene Aussage gemacht.
Die Medien haben die Situation übertrieben dargestellt.', 'Exaggerate' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'besorgen

Ich muss noch Brot und Milch besorgen.', 'to get / obtain something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'besorgen

Kannst du mir ein Ticket für das Konzert besorgen?
Meine Mutter hat die Dokumente für mich besorgt.', 'to buy / get something for someone' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'besorgen

Ich besorge die Getränke für die Party.', 'take care of' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Taschenlampe', 'Flashlight' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'vorherige seite

Blättern Sie zur vorherigen Seite.', 'Previous page

Turn to the previous page.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Landschaftsaufnahmen', 'Landscape photographs' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Es lohnt sich / Es lohnt sich mit Sicherheit.

Es lohnt sich mit Sicherheit, ihr zu folgen.
Es lohnt sich mit Sicherheit. es zu kaufen.', 'It''s worth / It''s definitely worth it.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich an verantwortung gewöhnen

Er muss sich an die Verantwortung als Teamleiter gewöhnen.
Nach dem Studium musste ich mich an mehr Verantwortung gewöhnen.', 'to get used to responsibility' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'seltsam', 'strange' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'halte für 

Ich halte ihn für intelligent.
Viele Leute halten das für eine gute Idee.
Niemand hätte das für möglich gehalten.', 'to consider / regard something as something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ehemalige

Mein ehemaliger Chef arbeitet jetzt in Berlin.
Ich habe gestern meine ehemalige Lehrerin getroffen.
Das ehemalige Fabrikgebäude wurde zu einem Museum umgebaut.', 'former' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Fabrik', 'Factory' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Wachsen

Die Kinder wachsen sehr schnell.
Die Bevölkerung der Stadt wächst jedes Jahr.
Mein Interesse an künstlicher Intelligenz wächst ständig.', 'to grow' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Der Rundgang', 'The tour' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'führen zu + Dativ

Der Reiseleiter führt die Gruppe durch die Stadt.
Der Rundgang führt zu allen wichtigen Sehenswürdigkeiten.', 'lead to, take someone to' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Interesse an + Dativ

Wir haben Interesse an diesem Kurs.
Bei Interesse an unserem Angebot kontaktieren Sie uns.', 'Immer dativ' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemandem Bescheid sagen

Kannst du mir bitte Bescheid sagen, wenn du angekommen bist?
Ich sage dir morgen Bescheid.
Bitte gib mir Bescheid, wenn du Hilfe brauchst.
Der Vermieter hat mir noch keinen Bescheid gegeben.', 'to inform someone / to let someone know' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gekündigt

Er hat seinen Job gekündigt, weil er eine bessere Stelle gefunden hat.
Ich habe meinen Handyvertrag gekündigt.', 'Resign from a job' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Die Kohlköpfe
Der Kohl

Die Kohle', 'The Cabbages
The Cabbage

The Coal' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'erfüllt

Die Wohnung erfüllt alle meine Anforderungen.
Er hat sich seinen Traum erfüllt und in Deutschland studiert
Der Kandidat erfüllt die Bedingungen für die Stelle.', 'eine Voraussetzung erfüllen = to meet a requirement 
eine Bedingung erfüllen = to satisfy a condition 
einen Wunsch erfüllen = to grant/fulfill a wish 
einen Traum erfüllen = to fulfill a dream' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'verraten

Er verrät mir ein Geheimnis.
Er hat sich verraten.', 'reveal / tell something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich aus etwas entwickeln

wie sich aus einer alten Tradition sein erfolgreiches Angebot „Sonntagmittag“ entwickelt hat', 'When you see: wie sich aus X Y entwickelt hat
mentally rearrange it into: Y hat sich aus X entwickelt' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bestehen + aus 

Der Masterstudiengang besteht aus mehreren Pflicht- und Wahlmodulen.
Das Team besteht aus fünf Studierenden.', 'consists of' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Informationen zu etwas

Informationen zum Kurs
Informationen zur Universität', 'information about something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'ungewöhnlich

Er hat eine ungewöhnliche Idee für sein neues Projekt.
Das Wetter ist heute ungewöhnlich warm für den Winter.', 'unusual or uncommon' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemandem nah sein

Meine Schwester ist mir sehr nah.
Er steht seinen Eltern nah.
Du warst mir ganz nah.
Bleib nah bei mir', 'close to someone' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'nicken

Er hat zustimmend genickt.
Er hat genickt.', 'nod' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'winken

Er hat gewinkt.', 'Waved' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einfarbig 

Für das Vorstellungsgespräch wählte sie eine einfarbige Bluse.
Viele Menschen mögen einfarbige Kleidung, weil sie leicht (easy) zu kombinieren ist.', 'single color' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'enttäuscht

Ich war sehr enttäuscht.', 'Disappointed' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Eines Tages

Eines Tages wirst du dein Ziel erreichen.
Sie hoffte, eines Tages ein eigenes Unternehmen zu gründen.', 'One day' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Atem

Nach dem Laufen ging mein Atem sehr schnell.
Ging dein Atem schnell, als du die Treppen hochgelaufen bist?', 'Breath' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'auf hoben

Die Kinder hoben die Münze vom Boden auf.
Meine Großmutter hob alle alten Briefe auf.', 'pick up' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'karierten Hemden', 'Checkered Shirt: https://www.google.com/search?q=checkered+shirt&udm=14' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Laune', 'Mood' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'voraussichtlich

Der Zug kommt voraussichtlich um 15:30 Uhr an.
Das Semester wird voraussichtlich im Oktober beginnen.', 'expected' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ansprechpartner 

Wer ist mein Ansprechpartner für die Wohnungsbewerbung?
Bei Fragen zum Studium ist Frau Müller Ihre Ansprechpartnerin.', 'Contact Person' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'der lieferant / die lieferanten

Die Lieferanten bringen die Waren jeden Morgen ins Geschäft.
Unser Unternehmen arbeitet mit mehreren Lieferanten zusammen.', 'Delivery Person / Supplier' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'fortbildung 

Nächste Woche nehme ich an einer Fortbildung zum Thema Künstliche Intelligenz teil.
Viele Unternehmen unterstützen ihre Mitarbeiter bei Fortbildungen.', 'Further education' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Um die Ecke 

Der Supermarkt ist gleich um die Ecke
Ich wohne um die Ecke von der Universität.
Das Café liegt direkt um die Ecke.', 'Around the corner' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'schätze

Ich schätze seine Ehrlichkeit.
Viele Gäste schätzen den guten Service.', 'Apprreciate' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemand scheint etwas zu tun

Er scheint müde zu sein.
Die Kinder scheinen Spaß zu haben.', 'someone seems to do something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Torten', 'Cakes' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Herrlich

Das Wetter ist heute herrlich, deshalb gehen wir im Park spazieren.
Wir hatten einen herrlichen Blick auf die Mosel.
Nach der Prüfung war es herrlich, endlich entspannen zu können.', 'Splendid / Wonderful' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Freude

Es macht mir Freude, Deutsch zu lernen.
Kinder zeigen ihre Freude oft ganz offen.', 'Joys' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'spüren
Ich spüre den Wind auf meiner Haut.

spülen
Ich spüle das Geschirr nach dem Essen.', 'Feel
Clean' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'bediene

Die Kellnerin bedient die Gäste freundlich und schnell.

In diesem Restaurant werden die Gäste von erfahrenen Kellnern bedient.', 'serve' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Begleiten

Meine Freundin begleitet mich zum Arzt.
Der Professor begleitet die Studierenden während ihres Projekts.', 'Accompany' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Das Blatt
Die Blätter', 'leaf
leaves' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Adjektiv als Nomen

Besonders → das Besondere ( -e endung and capitalize the Adjektiv )
gemeinsam → das Gemeinsam  ( -e endung and capitalize the Adjektiv )
angenehm → das Angenehmen ( -e endung and capitalize the Adjektiv )', 'Adjektiv als Nomen' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Adjektiv nomalizierung

Ich möchte etwas Kaltes trinken. ( -es endung )
Er hat nichts Besonderes gesagt. ( -es endung )', 'etwas Gutes = something good 
etwas Neues = something new
etwas Interessantes = something interesting
etwas Ähnliches = something similar' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Frisur', 'Hairstyle' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'angst vor etwas haben

Maria hat Angst vor großen Hunden.
Viele Menschen haben Angst vor öffentlichen Reden.

Vor der mündlichen Prüfung habe ich etwas Angst, aber ich versuche, nicht ständig daran zu denken.', 'Afraid' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'auf etwas verzichten

Verzichten Sie auf Alkohol.', 'to do without something / to avoid something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Speisen zubereiten

Ich bereite das Abendessen zu.', 'prepare food' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'feine

Das Restaurant serviert feine italienische Speisen.
Sie trägt eine feine goldene Kette.', 'Fine / High quality' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einverstanden + sein

Ich bin mit deinem Vorschlag einverstanden.
Wir sind damit einverstanden.', 'Agree' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Runde / Rund 

Wir waren eine nette Runde.
Beim Abendessen waren wir nur fünf Personen, aber wir waren eine nette Runde.', 'Group

We were a nice group.
At dinner there were only five of us, but we were a nice group.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Tisch abwischen', 'Clean the table' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Realisieren

Wir möchten das Projekt nächstes Jahr realisieren.
Sie hat ihre Geschäftsidee erfolgreich realisiert.', 'Carry out, implement' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'stiefel', 'boots' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufheben

Er hebt die Münze vom Boden auf.

Kannst du bitte dein Handy aufheben? Es liegt auf dem Boden.', 'pick up / lift' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Löcher

Meine alten Schuhe haben mehrere Löcher.

In der Straße gibt es einige tiefe Löcher.', 'Holes' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Flecken 

Auf meinem Hemd sind mehrere Flecken.
Die Flecken auf dem Teppich lassen sich nur schwer entfernen (Remove).', 'Stains' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Haffen

Im Hafen liegen viele Schiffe.
Wir haben einen Spaziergang am Hafen gemacht.', 'Harbor' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufpassen

Pass bitte im Unterricht gut auf.
Kannst du heute Abend auf meinen Hund aufpassen?', 'look out / watch out' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich Sorgen um etwas machen

Ich mache mir Sorgen um meine Familie.

Wir machen uns Sorgen um die Zukunft.', 'to worry about something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'schaufenster', 'large glass window at the front of a store where products are displayed.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Der Rock', 'Skirt' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zuhause

Jedes Kind braucht ein sicheres Zuhause.
Das Zuhause ist für viele Menschen ein wichtiger Ort.', 'Home' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'befriedigend

Meine Leistung in der Prüfung war nur befriedigend.
Das Ergebnis des Projekts ist befriedigend, aber es könnte besser sein.
Die Qualität des Essens war befriedigend.', 'Satisfactory' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Einzelnen

Die einzelnen Kapitel des Buches sind sehr interessant.
Wir haben die einzelnen Schritte des Projekts genau geplant.', 'Individual / Single' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufstellen

Wir stellen den Weihnachtsbaum im Wohnzimmer auf. (1)
Das Team hat einen neuen Plan aufgestellt. (2)
Die Universität hat neue Regeln aufgestellt. (3)
Die Forscher stellten eine neue Hypothese auf. (4)', '1. Set up
2. Draw up a plan
3. Establish a rule 
4. Propose' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'festgelegt 

Der Termin wurde bereits festgelegt.
Die Regeln für das Projekt wurden am Anfang festgelegt.', 'define / set

The appointment has already been set.
The rules for the project were established at the beginning.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'den Knopf', 'the button' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Bewerten

Viele Kunden bewerten das Restaurant mit fünf Sternen.
Es ist schwierig, die Qualität eines Modells objektiv zu bewerten.
Wir bewerten die Genauigkeit des Modells anhand verschiedener Metriken.', 'Evaluate' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gleichbereichtigt sein

In einer guten Beziehung sollten beide Partner gleichberechtigt sein.
Frauen und Männer sollten im Beruf gleichberechtigt behandelt (treat) werden.', 'equally' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Was am Ende zählt

Was am Ende zählt, ist nicht das Geld, sondern die Gesundheit.
Bei einer Prüfung zählt nicht nur die Note. Was am Ende zählt, ist, was man gelernt hat.', 'What pays at the end ...' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'zusammenlegen

Nach dem Trocknen lege ich die Wäsche zusammen.
Wir haben die Wäsche gewaschen und anschließend zusammengelegt.', 'Fold laundry' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'einräumen
ausräumen
abräumen', 'put things into something; load; tidy by putting things away
remove things from something; empty out
clear away things from a surface (table, desk, etc.)' from decks where name = 'German Converstaion';
insert into cards (deck_id, front, back) select id, 'Entstehen

Während meines Studiums ist mein Interesse an Künstlicher Intelligenz entstanden.
Wie entsteht ein gutes Team ?', 'develop / create / form' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'einsteigen

Es ist nich so einfach, nach so vielen Jahren wieder in den Beruf einzusteigen.', 'Get in' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Abstellen

Nach dem Lernen stelle ich meinen Laptop ab und gehe spazieren.', 'Turn off' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'jemanden um etwas bitten

Ich habe meinen Professor um Hilfe gebeten.
Er hat seine Freundin um Rat gebeten.', 'To ask someone for something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufsetzen

Er setzt sich Kopfhörer auf.', 'put on' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'einsetzen

Ich muss das Telefon einsetzen.', 'verwenden' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Fernbeziehung', 'Long-distance relationship' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ich lerne seit zwei Jahren Deutsch.
Ich lerne Deutsch, seitdem ich in Deutschland bin.', 'Seit ist kurz
Seitdem ist lang und braucht zwei satze' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Genie.

Z.B Du bist ein Komputer Genie.', 'Genius, Wizard' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Schulverweis

Wegen wiederholter Gewalt gegenüber Mitschülern erhielt er einen Schulverweis.', 'School Expulsion' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'zurechtzukommen (trenbarenverb) 

Ich komme mit dem neuen Job gut zurecht.
Sie kommt mit dem Stress nicht zurecht.', 'Cope with' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Betroffene

1. Die Betroffene schilderte der Polizei ruhig, was genau in der Nacht passiert war.
2. Die Betroffenen wurden gebeten, sich bis Ende der Woche bei der Behörde zu melden.', 'Affected people' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Stressoren

1. Die Betroffenen reagierten ganz unterschiedlich auf die verschiedenen Stressoren am Arbeitsplatz.', 'Stressors (Activities that trigger stress)' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'erhöht 

1. Der Arzt stellte bei dem Patienten ein erhöhtes Cholesterin fest.
2. Ein erhöhtes Tempo auf der Autobahn führt oft zu gefährlichen Situationen.', 'increased, elevated' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Linderung 

1. Die neue Salbe verschaffte ihr sofortige Linderung.
2. Bei starken Kopfschmerzen kann Wärme oft Linderung bringen.
3. Die Medikamente führten nur zu einer vorübergehenden Linderung der Symptome.
4. Er suchte Linderung von dem ständigen Lärm in der Stadt.', 'Relief, Allevation' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'auslösern (n), auslösen (v)

1. Der Detektiv suchte nach den Auslösern des Streits zwischen den Nachbarn.
2. Durch die richtige Ernährung kann man entzündliche Auslöser vermeiden.
3. Der Lärm löste den Alarm aus.', 'Trigger' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Umgang 

1. Ein respektvoller Umgang ist die Grundlage jeder guten Freundschaft.
2. Der Umgang mit schwierigen Kunden erfordert viel Geduld.
3. Sein Umgang mit Kritik hat sich deutlich verbessert.', '1. Respectful interaction is the foundation of every good friendship.
2. Dealing with difficult customers requires a lot of patience.
3. His handling of criticism has improved significantly.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'angemessen

1. Ein angemessenes Verhalten im Vorstellungsgespräch ist sehr wichtig.
2. Die Firma zahlte ihm eine angemessene Entschädigung für den Schaden.
3. Ist dieser Preis für die Qualität angemessen?', '1. Appropriate behavior during a job interview is very important.
2. The company paid him adequate compensation for the damage.
3. Is this price appropriate for the quality?' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Der Begriff

1. Der Begriff ''Nachhaltigkeit'' ist heute in aller Munde.
2. Kannst du mir diesen Begriff genauer erklären?
3. Ich habe keinen Begriff davon, wie schwer diese Arbeit ist.', 'Term, Concept' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'nicht wegzudenken

1. Das Smartphone ist aus dem Alltag nicht mehr wegzudenken.
2. Diese Brücke ist aus der Stadtlandschaft kaum wegzudenken.
3. Ihre Unterstützung war bei dem Projekt nicht wegzudenken.', 'impossible to imagine without

1. The smartphone is impossible to imagine away from everyday life.
2. This bridge is hardly imaginable without from the cityscape.
3. Her support was indispensable for the project.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'aufrechterhaltung

1. Die Aufrechterhaltung der öffentlichen Ordnung ist Aufgabe der Polizei.
2. Für die Aufrechterhaltung der Freundschaft ist regelmäßiger Kontakt wichtig.
3. Die Aufrechterhaltung dieses hohen Standards erfordert viel Disziplin.', 'Maintenance' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'gelegentlich

1. Wir treffen uns gelegentlich zum Kaffee.
2. Er macht gelegentlich einen Ausflug ins Grüne
3. Gelegentliche Regenschauer sind am Nachmittag möglich.', 'Occasionally' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'anwenden

1. Der Arzt wollte eine neue Behandlungsmethode anwenden
2. Sie musste ihr ganzes Wissen anwenden, um das Problem zu lösen.
3. Diese Regel wird nur in Ausnahmefällen angewandt.', '1. The doctor wanted to apply a new treatment method.
2. She had to apply all her knowledge to solve the problem.
3. This rule is only applied in exceptional cases.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Anliegen

1. Das ist mir ein echtes Anliegen.
2. Können Sie mir bei meinem Anliegen weiterhelfen?
3. Der Bürgermeister hörte sich die Anliegen der Bürger an.', 'Concerns, Issues' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'phänomen

1. Sie war ein wahres Phänomen auf dem Klavier.
2. Wissenschaftler versuchen, dieses unerklärliche Phänomen zu erforschen.', 'Phenomenon' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'mangelhaft

1. Die Qualität der Lieferung war mangelhaft.
2. Seine Deutschkenntnisse sind noch mangelhaft.', 'Inadequate, poor' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'beeinträchtigen

1. Der Lärm beeinträchtigte seine Konzentration.
2. Ihre Sehkraft wurde durch den Unfall dauerhaft beeinträchtigt.
3. Die Baustellen beeinträchtigen den Verkehrsfluss erheblich.', 'Affect negatively 

1. The noise impaired his concentration.
2. Her eyesight was permanently impaired by the accident.
3. The construction sites significantly impair the flow of traffic.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Anhand von

1. Er erklärte den Sachverhalt anhand von konkreten Beispielen.
2. Die Diagnose wurde anhand von Blutwerten gestellt.
3. Anhand von diesem Bericht können wir die Lage (situation) besser einschätzen (assess).', 'Based on' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'abgehauen

sie ist abgehauen', 'ran away' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich auf den Weg begeben

Nach dem Frühstück begebe ich mich auf den Weg zur Universität.
Ich begebe mich auf eine Reise', 'Go to' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Nachsuchen + Dativ

Sucht nicht nach mir!', 'search for' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'herrschen

In unserem Betrieb herrscht eine freundliche Atmosphäre.
Nach dem Unfall herrschte Chaos.
Im Büro herrscht Ruhe.', 'to prevail / to exist / to dominate or there is (for natural english)' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'anziehen

Die Stadt zieht viele Touristen an.
Das Geschäft versucht, neue Kunden anzuziehen.', 'attract' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'anziehen 

Ich ziehe meine Jacke an.
Das Schloss zieht jedes Jahr viele Touristen an.', 'wear' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'vervollständigen + Akkusativ

ein Formular vervollständigen
eine Liste vervollständigen
Informationen vervollständigen', 'Complete / fill in' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Vorurteilen

Er hat Vorurteile gegenüber Ausländern.
Sie versucht, ihre Vorurteile abzubauen.', 'Prejudice' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'abbauen

Die Regierung plant, Bürokratie abzubauen.
Sport kann helfen, Stress abzubauen.
Der Kontakt mit anderen Kulturen hilft dabei, Vorurteile abzubauen.', 'reduce' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'ausgereift

Die Software ist mittlerweile ausgereift und funktioniert sehr zuverlässig.
Sie hat einen ausgereiften Plan für ihr Projekt.
Diese Technologie ist bereits ausgereift.', 'well-developed, well-completed' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'wiederlegen

Die Studie konnte diese Behauptung widerlegen.
Er konnte die Vorwürfe mit Beweisen widerlegen.
Diese Ergebnisse widerlegen die bisherige Theorie.', 'prove something that is wrong' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'belegen

Die Studie belegt, dass regelmäßiger Sport gesund ist.
Diese Zahlen belegen seine Aussage.', 'prove' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Der Schnickschnack

Ich brauche kein Schnickschnack, ich möchte einfach ein zuverlässiges Handy.
Das Programm ist einfach und übersichtlich, ohne unnötigen Schnickschnack.', 'unnecessary fancy stuffs' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Beweis', 'Proofs' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Beherrschtheit

Seine Beherrschtheit in dieser schwierigen Situation hat mich beeindruckt.
Trotz der Kritik bewahrte sie ihre Beherrschtheit.
Durch seine große Beherrschtheit konnte er ruhig reagieren', 'self-control / composure / calmness' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Stehvermögen

Sein Stehvermögen hat ihm geholfen, das schwierige Projekt zu beenden.
Beim Marathon ist nicht nur Schnelligkeit, sondern auch Stehvermögen wichtig.', 'Stamina' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'zur Geltung bringen

In diesem Beruf kann ich meine Stärken zur Geltung bringen.
Der Lehrer gibt den Schülern die Möglichkeit, ihre Fähigkeiten zur Geltung zu bringen.', 'highlight / showcase / bring out / make something stand out' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'unausweichlichen

Wir müssen uns den unausweichlichen Veränderungen anpassen.
Der Klimawandel hat unausweichliche Folgen für unsere Gesellschaft.', 'inevitable' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Fortschritts

Die Geschwindigkeit des Fortschritts hängt von vielen Faktoren ab.
Ohne die Unterstützung des Teams wäre der Fortschritt des Projekts langsamer gewesen.', 'progress' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'in der Lage sein

Ich bin in der Lage, das Problem zu lösen.
Sie ist nicht in der Lage, die Aufgabe allein zu erledigen.
Der Computer ist in der Lage, große Datenmengen zu verarbeiten.
Ich bin in der Lage, Deutsch zu sprechen.', 'to be able to do something / to be capable of doing something' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'verwalten

Der Administrator verwaltet die Benutzerkonten.
Die Universität verwaltet die Wohnungen für die Studierenden.', 'manage' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'aufzuzeichnen

Die Kamera ist in der Lage, alle Bewegungen aufzuzeichnen.
Ich habe vergessen, die Vorlesung aufzuzeichnen.
Das Programm ermöglicht es, die Daten automatisch aufzuzeichnen.', 'to record / to document / to log' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'Wohlbefinden

Regelmäßige Bewegung ist wichtig für das körperliche Wohlbefinden.
Das Wohlbefinden der Bewohner steht für uns an erster Stelle.
Genügend Schlaf verbessert das allgemeine Wohlbefinden.', 'well-being / feeling of being comfortable and healthy' from decks where name = 'German Grammar';
insert into cards (deck_id, front, back) select id, 'verschandeln

Graffiti hat die historische Fassade des Gebäudes verschandelt.
Die Werbung verschandelt die schöne Landschaft.', 'to spoil/disfigure something, especially by making a place or object ugly.' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'purzeln

Die Kinder purzelten die Treppe hinunter.
Er stolperte und purzelte ins Gras.
Ein paar Schneebälle purzelten den Hang hinunter.', 'tumble' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Sommerschlussverkauf', 'Summer clearance sale' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'verteidigen

Der Anwalt muss seinen Mandanten (clients) vor Gericht verteidigen.
Sie verteidigte ihre Meinung mit überzeugenden Argumenten.', 'defend' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'etwas für etwas halten

Ich halte ihn für einen guten Lehrer.
Viele halten das für eine gute Idee.', 'to consider / to regard / to think of something as' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Ergiben sich

Manches ergibt sich gleichsam natürlich, die Sprache begleitet den Import der Dinge.
Aus dieser Situation ergibt sich ein neues Problem.

Im Gespräch ergaben sich mehrere Möglichkeiten.', 'arise / resulted' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'begleiten

Kannst du mich zum Bahnhof begleiten?
Meine Freundin hat mich zum Arzt begleitet.', 'Accompany' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Begeisterung

Er spricht mit großer Begeisterung über seinen neuen Job.
Die Kinder waren voller Begeisterung, als sie das Geschenk sahen.', 'enthusiasm / excitement / passion' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'entfesselten

Die entfesselten Emotionen waren nur schwer zu kontrollieren.
Der Sturm entfachte entfesselte Kräfte der Natur.', 'unleashed / unrestrain' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'abfinden

Ich muss mich mit dieser Entscheidung abfinden.
Manchmal muss man sich mit schwierigen Situationen abfinden.', 'to accept / come to terms with something' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'breitbeiniges

Der Mann stand breitbeinig vor der Tür.
Das breitbeinige Sitzen im Bus störte die anderen Fahrgäste.', 'wide-legged sitting' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'verankern

Das Unternehmen hat Nachhaltigkeit in seiner Strategie verankert.
Die Schule möchte Umweltbewusstsein stärker im Unterricht verankern.', 'anchor / embed deeply' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'Betritt

Nach seinem Beitritt zur Partei engagierte er sich aktiv.
Für den Beitritt zum Verein muss man einen Antrag ausfüllen.
Nach dem Beitritt zum Fitnessstudio kann ich dort jederzeit trainieren.', 'Joining / Accession / Membership' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'sich mit etwas befassen

Ich befasse mich gerade mit deutscher Grammatik.
Wir müssen uns mit diesem Problem befassen.', 'deal with' from decks where name = 'German Words';
insert into cards (deck_id, front, back) select id, 'verstand

Wie film serien uns verstand kontrollieren ?', 'mind' from decks where name = 'German Words';
