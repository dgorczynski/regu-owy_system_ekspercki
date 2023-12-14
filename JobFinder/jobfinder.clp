
;;;======================================================
;;;   	Film industry job finder
;;;
;;;     THIS SYSTEM FINDS THE PERFECT JOB FOR YOU IN THE FILM INDUSTRY.
;;;
;;;     CLIPS Version 6.3 Example
;;;
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine-money-preference ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted money-important)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-money-possesion ""

   (logical (money-important Yes))

   =>

   (assert (UI-state (display MoneyPossesionQuestion)
                     (relation-asserted money-posession)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cooperate-ability ""

   (logical (money-important No))

   =>

   (assert (UI-state (display CooperateQuestion)
                     (relation-asserted cooperate-ability)
                     (response Notreally)
                     (valid-answers Notreally SureButIllMakeItMine ICanFakeIt))))
                     
(defrule determine-literary-talent ""

	(logical (cooperate-ability Notreally))
	
	=>
	
	(assert (UI-state (display LiteraryTalentQuestion)
					  (relation-asserted literary-talent)
					  (response No)
					  (valid-answers No IThinkSo Yes))))
					  
(defrule determine-literary-talent-feelings ""

   (logical (literary-talent No))

   =>

   (assert (UI-state (display FeelingsQuestion)
                     (relation-asserted literary-talent-feelings)
                     (response No)
                     (valid-answers No Yes))))
                     
(defrule determine-exceptional-talent ""

	(logical (cooperate-ability SureButIllMakeItMine))
	
	=>
	
	(assert (UI-state (display ExceptionalTalentQuestion)
					  (relation-asserted exceptional-talent)
					  (response No)
					  (valid-answers No Yes))))
			
(defrule determine-unknown-or-female ""

	(logical (exceptional-talent Yes))
	
	=>
	
	(assert (UI-state (display UnknowOrFemaleQuestion)
					  (relation-asserted unknown-or-female)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-exceptional-talent-feelings ""

   (logical (exceptional-talent No))

   =>

   (assert (UI-state (display FeelingsQuestion)
                     (relation-asserted exceptional-talent-feelings)
                     (response No)
                     (valid-answers ItsNotAboutTalentButHardWork Yes))))
				    
(defrule determine-visual-orientation ""

   (logical (cooperate-ability ICanFakeIt))

   =>

   (assert (UI-state (display VisualOrientationQuestion)
                     (relation-asserted visual-orientation)
                     (response No)
                     (valid-answers No YouMeanTheWayILook Yes))))

(defrule determine-cleaning-skills ""

   (logical (visual-orientation No))

   =>

   (assert (UI-state (display CleaningSkillsQuestion)
                     (relation-asserted cleaning-skills)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-cleaning-skills-feelings ""

   (logical (cleaning-skills Yes))

   =>

   (assert (UI-state (display CleaningFeelingsQuestion)
                     (relation-asserted cleaning-skills-feelings)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-musicial-talent ""

   (logical (cleaning-skills No))

   =>

   (assert (UI-state (display MusicalTalentQuestion)
                     (relation-asserted musical-talent)
                     (response No)
                     (valid-answers No Yes))))
                   
(defrule determine-any-skills ""

   (logical (musical-talent No))

   =>

   (assert (UI-state (display AnySkillsQuestion)
                     (relation-asserted any-skills)
                     (response Sit)
                     (valid-answers Sit Drive))))

(defrule determine-steel-arms ""

   (logical (musical-talent Yes))

   =>

   (assert (UI-state (display SteelArmsQuestion)
                     (relation-asserted steel-arms)
                     (response No)
                     (valid-answers No Yes))))
   
(defrule determine-imagination-and-no-shame ""

   (logical (visual-orientation YouMeanTheWayILook))

   =>

   (assert (UI-state (display ImaginationQuestion)
                     (relation-asserted wild-imagination-no-shame)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-young-and-hot ""

   (logical (wild-imagination-no-shame Yes))

   =>

   (assert (UI-state (display YoungAndHotQuestion)
                     (relation-asserted young-and-hot)
                     (response No)
                     (valid-answers No Hot Yes))))

(defrule determine-polishing-the-turd-preferences ""

   (logical (visual-orientation Yes))

   =>

   (assert (UI-state (display PolishingTurdQuestion)
                     (relation-asserted polishing-the-turd)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-therapist-degree ""

   (logical (polishing-the-turd Yes))

   =>

   (assert (UI-state (display TherapistQuestion)
                     (relation-asserted therapist)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-babyface-or-female ""

	(logical (polishing-the-turd No))
	
	=>
	
	(assert (UI-state (display BabyfaceOrFemaleQuestion)
					  (relation-asserted babyface-or-female)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-cooler-than-fonzie ""

	(logical (babyface-or-female No))
	
	=>
	
	(assert (UI-state (display FonzieQuestion)
					  (relation-asserted cooler-than-fonzie)
					  (response No)
					  (valid-answers No Yes))))

(defrule determine-subordination ""

	(logical (babyface-or-female Yes))
	
	=>
	
	(assert (UI-state (display SubordinationQuestion)
					  (relation-asserted subordination)
					  (response No)
					  (valid-answers No Yes))))
					  
(defrule determine-desire-to-direct ""

	(logical (subordination No))
	
	=>
	
	(assert (UI-state (display DesireToDirectQuestion)
					  (relation-asserted desire-to-direct)
					  (response Yes)
					  (valid-answers Yes ItsNotASecret))))

(defrule determine-enjoy-waiting ""

	(logical (subordination Yes))
	
	=>
	
	(assert (UI-state (display EnjoyWaitingQuestion)
					  (relation-asserted enjoy-waiting)
					  (response No)
					  (valid-answers No Yes))))	
					  				  
;;;****************
;;;* JOBS RULES *
;;;****************

(defrule DairyOwner ""

	(logical (money-posession No))
	
	=>
	
	(assert (UI-state (display DairyOwner)
					  (state final))))

(defrule StudioHead ""

	(logical (money-posession Yes))
	
	=>
	
	(assert (UI-state (display StudioHead)
					  (state final))))
					  
(defrule Screenwriter ""

	(logical (literary-talent Yes))
	
	=>
	
	(assert (UI-state (display Screenwriter)
					  (state final))))

(defrule Blogger ""

	(logical (literary-talent IThinkSo))
	
	=>
	
	(assert (UI-state (display Blogger)
					  (state final))))

(defrule StarvingWriter ""

	(logical (literary-talent-feelings No))
	
	=>
	
	(assert (UI-state (display StarvingWriter)
					  (state final))))

(defrule FilmCritic ""

	(logical (literary-talent-feelings Yes))
	
	=>
	
	(assert (UI-state (display FilmCritic)
					  (state final))))

(defrule Director ""

	(logical (unknown-or-female No))
	
	=>
	
	(assert (UI-state (display Director)
					  (state final))))

(defrule IndieFilmmaker ""

	(logical (unknown-or-female Yes))
	
	=>
	
	(assert (UI-state (display IndieFilmmaker)
					  (state final))))

(defrule HeadOfFilmCommission ""

	(logical (exceptional-talent-feelings Yes))
	
	=>
	
	(assert (UI-state (display HeadOfFilmCommission)
					  (state final))))
				  
(defrule FilmSchoolTeacher ""

	(logical (exceptional-talent-feelings ItsNotAboutTalentButHardWork))
	
	=>
	
	(assert (UI-state (display FilmSchoolTeacher)
					  (state final))))
				
(defrule Producer ""

	(logical (cleaning-skills-feelings Yes))
	
	=>
	
	(assert (UI-state (display Producer)
					  (state final))))  

(defrule Catering ""

	(logical (cleaning-skills-feelings No))
	
	=>
	
	(assert (UI-state (display Catering)
					  (state final))))

(defrule Runner ""

	(logical (any-skills Drive))
	
	=>
	
	(assert (UI-state (display Runner)
					  (state final))))

(defrule Audience ""

	(logical (any-skills Sit))
	
	=>
	
	(assert (UI-state (display Audience)
					  (state final))))
	
(defrule Soundie ""

	(logical (steel-arms Yes))
	
	=>
	
	(assert (UI-state (display Soundie)
					  (state final))))
					  			  
(defrule Composer ""

	(logical (steel-arms No))
	
	=>
	
	(assert (UI-state (display Composer)
					  (state final))))
					  
(defrule Extra ""

	(logical (wild-imagination-no-shame No))
	
	=>
	
	(assert (UI-state (display Extra)
					  (state final))))					  
					  			  					  			  				  			 
(defrule ActingTeacher ""

	(logical (young-and-hot Hot))
	
	=>
	
	(assert (UI-state (display ActingTeacher)
					  (state final))))					  
	
(defrule Actor ""

	(logical (young-and-hot Yes))
	
	=>
	
	(assert (UI-state (display Actor)
					  (state final))))	
					  				  
(defrule CharacterActor ""

	(logical (young-and-hot No))
	
	=>
	
	(assert (UI-state (display CharacterActor)
					  (state final))))	
					  	                    
(defrule MakeUpArtist ""

	(logical (therapist Yes))
	
	=>
	
	(assert (UI-state (display MakeUpArtist)
					  (state final))))		
					  
(defrule Editor ""

	(logical (therapist No))
	
	=>
	
	(assert (UI-state (display Editor)
					  (state final))))	
					  	
(defrule Gaffer ""

	(logical (cooler-than-fonzie No))
	
	=>
	
	(assert (UI-state (display Gaffer)
					  (state final))))		
					  
(defrule DP ""

	(logical (cooler-than-fonzie Yes))
	
	=>
	
	(assert (UI-state (display DP)
					  (state final))))		

(defrule Wardrobe ""

	(logical (desire-to-direct Yes))
	
	=>
	
	(assert (UI-state (display Wardrobe)
					  (state final))))		

(defrule ArtDirector ""

	(logical (desire-to-direct ItsNotASecret))
	
	=>
	
	(assert (UI-state (display ArtDirector)
					  (state final))))		

(defrule WardrobeAssist ""

	(logical (enjoy-waiting Yes))
	
	=>
	
	(assert (UI-state (display WardrobeAssist)
					  (state final))))		

(defrule CameraAssist ""

	(logical (enjoy-waiting No))
	
	=>
	
	(assert (UI-state (display CameraAssist)
					  (state final))))		
					  					  					  					  				  					  					  					                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   
