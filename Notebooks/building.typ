#import "/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, team-name: "5839B", season: "Water Game", year: "2024-2025")


#create-frontmatter-entry(
  title: "Table of Contents",
  date: datetime(year: 2024, month: 1, day: 9),
)[
  #components.toc()
]
#create-body-entry(
  title: "Introduction",
  type: "test",
  date: datetime(year: 2024, month: 3, day: 9),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
 
]
#create-body-entry(
  title: "First Steps",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 9),
  author: "Davis Bodami",
  witness: "Brandon Lewis"
)[
  = Post Season Build Analysis 

  For the building of our previous robot even though it unfortunately did not make worlds there were a lot of aspects executed properly and poorly to be identified. This is important as it allows the team to know what works and to keep doing as well as what to change in order to improve for the next season.

  *Drive Train* The Drive Train is the base of any robot. The previous seasons drive train used 6 11w motors with the blue cartidge and a 48:60 gear ratio giving an RPM of 480. This spun 3 4" omni wheels with the middle one on each side being locked. 
  #components.pro-con(
    pros:  [
        - Speed
        - Pushing power
        - Strong Wedge

      ],
    cons:  [
      - Turning
      - Reliability 
      - Over Heating
      - Field Traversal

      ]
  ) 

  *Intake* The intake was powered by 1 5.5w motor spining a series of 2" 45A flexwheels to interact with the game objects. The intake was also allowed to float so that it could raise over the goal to score the triball. 
  #components.pro-con(
    pros:  [
        - Holding ability
        - Scoring
        - Reliability
        - Effectiveness 

      ],
    cons:  [
      - Chain Broke once

      ]
  ) 

  *Wings* These were pneumatically activated flaps that would extend 9in on either side of the robot. These allowed for a large amount of game objects to be pushed into the goal at one time. 
  #components.pro-con(
    pros:  [
        - Never failed
        - Reached corners
        - Simple Design

      ],
    cons:  [
      - Bent after multiple matches

      ]
  ) 
  
  *Flywheel Arm* this was a 4" Flexwheel with a ratchet spining at 3600 RPM off of a blue motor. Game obejcts were placed and laumched off of the flywheel. It could also be raised by a 5.5w motor assisted by rubber bands to shoot over other robots. 
  #components.pro-con(
    pros:  [
        - Consistent firing
        - Fast firing
        - Height
        - Ratchet persrved motor health

      ],
    cons:  [
      - Unable to use the arm for climbing
      - Flywheel got jammed on a standoff in 2 matches

      ]
  ) 
  
  *Odometry Modules* These are 3 modules 2 vertical and 1 horizantal that are used to track the robots position. They are jointed to always be in contact with the ground, and have a 3.25" omni wheel spin an encoder to track movements. 
  #components.pro-con(
    pros:  [
        - Simple Design

      ],
    cons:  [
      - Bent over time
      - Large
      - Unreliable gorund contact 

      ]
  ) 



  

  = What to do now?

  - With the biggest problem being the drive a variety of drives should be modeled and tested in order to have a better idea of what works for the next season

  - Work to create new odometry module desings that are stronger and more compact

  - Take inventory of the parts available to our team so that when designing we know what parts we can use and how many of them are available 

  - Put together an order list of parts that the team wants to asses the needed funds

  - See what funding is available to the team and what amount should be allocated to new parts 

  - Look into making a functional PTO (power take off) as they can allow for more powerful drives while still having all the desired mechanisms to manipulate game objects

  - Look for or model our own paddels for the controller that suite the needs of our driver


]

#create-body-entry(
  title: "3d design software",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  Before any models for possible drive trains or new odometry sensors can be made a decision on what software to use is necessary. In the previous season we adpoted Autodesk inventor. There exists 3 main options other then inventor for vex which include Solid Works, Fusion 360, and Onshape. Each has a variety of favorable aspects to be considered when choosing. 

  The best way to comapre these is through a decision matrix of various aspects of each

  #components.decision-matrix(
    properties: (
      (name: "Familiarty", weight: 30),
      (name: "Acessability", weight: 20),
      (name: "Availble Part Libraries", weight: 5),
      (name: "Availble Help Recoruces", weight: 5),
      (name: "Vex Compata- bility", weight: 2),
      (name: "Ease of Use", weight: 2),
    ), 
    ("Inventor",     5, 5, 4, 5, 4, 3),
    ("Fusion 360", 3, 3, 5, 3, 5, 4),
    ("Solid Works",   2, 4, 3, 2, 3, 3),
    ("Onshape",   1, 5, 4, 3, 4, 4),
  )
  #components.admonition(type: "note")[
    Inventor scored far higher in some categories compared to other teams due to Eastern Tech's Engineering Program. This program which the majority of the team is in teaches Inventor and provides us with a browser version of it. This ngeates Onshapes main advantage and gives us 3 teachers who can help fix any problems we run into. 
  ]
  #components.admonition(type: "decision")[
    Due to a variety of reasons the main one being a lack of time to learn a new software and familiarty with Inventor it will continue to be our primary design software. 
  ]


]
#create-body-entry(
  title: "File Structure/Model Management",
  type: "management",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
  To effectivley use any software wether for coding or modeling file organization is key. To share these files the team makes use of Microsoft Onedrive since it works best with windows device which the majority of the team has. 

  For the Inventor the main robot assembly is made from a variety of sub assemblies. These sub assemblies are each for a key system such as the drive train or intake. There can exist further sub aseemblies within these as well such as that for the odometry sensors within the assembly they are attachetd to. To organize the many file for this a variety of naming conventions are used based off of the guide lines from Perdu Sig Robotics.

  - Robots are marked with a folder labeled "! Robot Name"

  - Within in that folder is the main assembly of the same name

  - Assemblies or cut parts used throughout the model are stored in this high level folder

  - There are also folders with each of the sub-assemblies labeled "Assembly Name"

  - Within the sub-assembly folders are all the special cut parts and sub-assemblies of that Assembly. 

  - All other parts are stored in a default parts folder with every vex part organized by type 

  This system comes with a variety of advantages for the team. Indivudal axels or mechanisms be edited without opening the whole robot which allows team members to interact with the models without a powerful computer. It also allows for big changes to be made easier as the major sub-assemblies can be removed or changed without having to edit a bunch of indivudal parts. This also helps during the build process as we can divide the many sub-assemblies between any teammembers without other work to do. This has proven in the past to allow us to build full redesigns in just a week and half such as what we did after dulaney last year. 
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\Over Under File Structure.png", width: 80%)
    ],
    caption: [ Inventor Files from the Over Under Season
    ]
  )

  
]

#create-body-entry(
  title: "Taking Inventory",
  type: "management",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  Before any designing can take place it is key to know the constraints one is placed under. For vex a key way of doing this other then reading the rules is too see what parts are available to your team. You may have the best idea for a design but without hte parts to build that idea is jsut waisted time.In order to see what parts we had an excel spread sheet was created with all Vex Parts that were in our Inventor parts library as well as newer ones found the Vex website. Additionally Tools and other accesories from the Robosource website were included that we deemed may prove useful.

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\pre-inventory top half.png", width: 80%)
    ],
    caption: [ Top half of the Inventory Spread Sheet
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\pre-inventory bot half.png", width: 80%)
    ],
    caption: [ Bottom half of the Inventory Spread Sheet
    ]
  ) <odomDiagram>

  The Spreadsheet will take a while to fill out, but for now parts with known quanitities such as zero have been filled out. Those were marked with yellow to indicate more were needed. These were then taken to a second spreadsheet. This lays out all the parts and tools we want, their price, quanity, link to purchase, and priority. The priority is key as it allows us to make decisions on what to get within our budget. 

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img\order list frame work.png", width: 80%)
    ],
    caption: [ Order Spread Sheet with a calculation test
    ]
  ) <odomDiagram>


  #components.admonition(type: "note")[
    Currently the budget is at zero as dues are yet to be collected and no fund raisers have been planned. It also improt to consider that a small percentage of the school's 15,000 dollar engineerign budget is randomly allocated to us so we will have that to work with. 
  ]
]
#create-body-entry(
  title: "Inventory Results",
  type: "management",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  After a week of work we were able to complete all rows of the spread sheet and figure out what parts the team was in need of. A variety of methods were used to measure the various parts. Large parts like Wheels and Motors were counted but other parts required a different aporach. String wires, and tubing were measured in feet, and metal strcuture by its weight. For parts like screws and nuts a single unit was weighed as well as the container and the total amount we had. The weight of the container was then subtracted from the total and then divided by the unit to find the total quanity. 

  Overall we found that we had a good quanitity of most parts that we had however there were many parts absent from our collection. Based on the next game new parts can be ordered based on that game. 
  
  #components.admonition(type: "note")[
    We found our time managment to be extremely poor during this endevor which greatly increased its length. To adress this we may work to change how the team meets to allow for not only more time, but better uses of that time. 

  ]

]
#create-body-entry(
  title: "Drive Train Types",
  type: "brainstorm",
  date: datetime(year: 2024, month: 3, day: 17),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
  = New Drive Models 

  There exists a variety of drive models both practicle and impracticle that can be made with the VRC legal parts. It is important to judge where each one can shine to see which is the most practical when the next game releases. A decision can not be made yet for which drive is best, but the strenghts and weakness of each one can be assesed as well as models for the more practical ones generated. These models can give us a head start on the next seasons bot if they prove adequate for the next game as well as allow the team to test various ideas. 

  = Tank Drive 

  A large variety of what can be considered a tank drive or differential drives exist within vex. These work by having two sides where each sides wheels all spin together. This allows for linear motion(Both sides spin the same direction), turning (Both sides spin opposite), and arcing (One side spins slower then the other in the same direction). These drives are often the simpilist and provide a wide range of motion while remaining able to push back against other robots. These  drives can also be achieved in a variety of ways with varying numbers and sizes of wheels that augment their performance. 

  4in wheels provide greater speed as per each rotation the robot moves farther, however they give the robot less torque. Additonally since less of them can fit onto a dirve with the 18*18*18 size limit there is also less points of contact. Additionaly with the older 4in wheels the team currently own the traction versions are .125in smaller then the omni versions

  3.25in wheels provide slower speeds, but are able to give the robot more pushing power as they have more torque and points of contact. These wheels are also easier to work with as the traction and omni versions are the same size unlike with the older 4in wheels

  Omni wheels have rollers that allow the wheel to move side to side as well as forward and back. This makes them great for turning, but poor for traction. 

  Traction wheels wheels are all rubber and provide exceptional ground adherence for any robot, however they greatly limit turning making them impractical unless used as the middle wheel where there effects on truning are midigated. 

  From our teams expirence a 3.25in drive with 2 traction wheels in the middle and 2 omni wheels on either end appears to be the optimal way to execute this drive. Our previous drive with 3 4in omniwheels failed to push back agaisnt other robots that were using 3.25 in tank drives with the same amount of motors. These robots also were just as fast and maneuverable as ours showing little trade off for this design. 

  #components.pro-con(
    pros:  [
        - Simplicity
        - Versatility
        - Easier to Control

      ],
    cons:  [
      - Limited Mobility 
      - Wheel incompatabilities
      ]
  ) 
  = H/X Drives

  These use either 4 or 5 omni wheels to achieve a robot that has the same range of motion as a Tank Drive, but with the additon of diagnol and horizantal movements. They either use in the case of an X drive 4 indivudally powered omni wheels in each corner at 90 degress from one another or 4 indivudallty powered onmi wheels in a traditional tank drive setup with one horizantal omni wheel for the H drive. These drives can however, prove dificult to control and in the case of the H drive impractical as the horizantal wheel rarley makes contact. They are also very easy to push around since all the wheels are omni. X drives can prove highly practical given the right game and design but in games such as over under the middle bar limits their use. 

  #components.pro-con(
    pros:  [
        - Maneuberability
        - Complex Autonmous
        - Strafing 
      ],
    cons:  [
      - Mechanical Complexity
      - Motor Usage 
      - Practicality
      - Low Traction/Easy to push
      ]
  ) 
  = Mecanum Drives

  Mecanum drives are likley the most special as they use specialized mecanum wheels. These like omni wheels have roller attached, but at an angle to provide unqiuley augmented movment. When set up correctly 4 indvidually powered mechnum wheels can provide the same movment as a X drive. However, since to go in any direction it directly turns the mecanum wheels they are harder to push as the motors resist the pushing directly. This along with other issues can also lead to faster overheating with mecanum drives. The vex edr 4in mecanum wheels are very bulky putting more strain on the motor additonally, the vex mecanum wheels unlike msot desings have limited contact with the ground due to the iregular design of their rollers. It is also important to note it easier to gear and build a frame for a mecnum drive over and X drive as it does not require the 45 degree angels to achieve its unique motion. Though also possible with an X drive an additional powered omni wheel could be put into the middle to provide more drive power. Since this wheel isnt needed at all times if a succesful PTO can be developed it could allow for a very versatile robot and drive. 
  #components.pro-con(
    pros:  [
        - Maneuberability
        - Complex Autonmous
        - Strafing
      ],
    cons:  [
      - Mechanical Complexity
      - Motor Usage 
      - Practicality
      - Requires balanced weight 
      ]
  ) 




  = Swerve Drives

  Previously considered impractical for vex swerve drives invlove either 3 or 4 independently steered and powered wheels. These focus around modules that can both rotate the oreintation of and spin the wheels. This allows for the robot to turn rapidly as well as turn while moving. The wheels can positioned in the manner of a tradtional tank drive for linear movement and then turned to go the desired driection. However until the addition of the 5.5w motors these would either use 6 or all 8 of the robots availble motors. The 5.5w motors now allow for this drive to be possibly practical as a 3 wheel swerve drive could be made from 3 11w motors and 3 5.5w motors allowing for 38.5w of motors to be allocated to the robots mechanisms and manipulators. The advantages of swerve drives can be seen from other competitions like frc where they are often used to great success to create highly maneuverable bots. The use of one within vex would be highyl dependent on the game as one that with limtied room to move such as over under takes away many of a swerve drives advantages. It is worth creating a model for a swerve drive module incase the next game is one that priortizes movement. It would also provide practice using more complex gearing which the team has yet to expirment with. 

  #components.pro-con(
    pros:  [
        - Maneuberability
        - Complex Autonmous
      ],
    cons:  [
      - Mechanical Complexity
      - Motor Usage 
      - Practicality
      ]
  ) 

]
#create-body-entry(
  title: "New Odometry Sensors",
  type: "build",
  date: datetime(year: 2024, month: 3, day: 17),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  Odometry is a position tracking algorithim used by the coder to implement complex autons. It relies on three sensors 2 vertical and 1 horizantal. The failures of the previous design were compactness and resilliance and the new designs makes a few imrpovments to this area. It is important to complete this first as any protoype drives made must be designed to fit the sensors. This along with a basic mecnum drive which can act as a tank drive when need be will allow the coder to begin making some basic frameworks for next year. 

  New Design:

  - Verical Wheels save space by being in the same module

  - No plate is used without being reinforced

  - Pillow bearings used to simplfy mounting

  - Newer 3.25in wheels used for better traction
  #figure(
      rect(fill: black.lighten(10%))[
        #image("img/Vertical Odom Isometric.png", width: 80%)
      ],
      caption: [ Isometric View of the New Vertical Odometry Sensor
      ]
    ) <odomDiagram>
  #figure(
      rect(fill: black.lighten(10%))[
        #image("img/Vertical Odom Front.png", width: 80%)
      ],
      caption: [ Front View of the New Vertical Odometry Sensor
      ]
    ) <odomDiagram>
  #figure(
      rect(fill: black.lighten(10%))[
        #image("img/Horizantal Odom Isometric.png", width: 80%)
      ],
      caption: [ Isometric View of the New Horizantal Odometry Sensor
      ]
    ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Horizantal Odom Front.png", width: 80%)
    ],
    caption: [ Front View of the New Horizantal Odometry Sensor
    ]
  ) <odomDiagram>
  
  
]
#create-body-entry(
  title: "Drive Train Prototypes",
  type: "build",
  date: datetime(year: 2024, month: 3, day: 17),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  With inventory taken we can now begin to make some designs. To expirment with more complex Drives a Mechnum drive and a Swerve Drive module were completed. These should provide good practice for designing before the next season as well possibly giving us a head start if we choose to use these drives. 

  The first model made was that of a Mecanum Drive:

  - 4 Mecanum wheels geared to 300 RPM with a 72:48 ratio driven by an 11w motor with the 600rpm cartrige. 

  - 24in HS axels with holes drilled in them as the main frame to ensure it was stronger then our previous drive trains.

  - Center Omni Wheel for additional power

  - PTO to allow for the cneter omni wheel to power other system while not in use

  - Battery and Air Tanks kept low to ensure a proper center of gravity

  - New Odometry Sensor fitted in the rear
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Mecanum Drive Proto Isometric.png", width: 80%)
    ],
    caption: [ Isometric View of the Prototype Mecanum Drive
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Mecanum Drive Proto Top.png", width: 80%)
    ],
    caption: [ Top View of the Prototype Mecanum Drive
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Mecanum Drive Proto Front.png", width: 80%)
    ],
    caption: [ Front View of the Prototype Mecanum Drive
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Mecanum Drive Proto Side.png", width: 80%)
    ],
    caption: [ Side View of the Prototype Mecanum Drive
    ]
  ) <odomDiagram>
  

  Before we could enter school to test this I created a Model for a Swerve Drive module:

  - Keeps design compact with motors below the frame

  - 72 tooth gear is screwed to the frame so they spin together

  - Circular insert within the gear to allow the drive shaft to turn

  - Chain runs to connect the Drive Shaft to the 11w motor

  - 5.5w motor used to turn module
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Swerve Drive Module Isometric.png", width: 50%)
    ],
    caption: [ Isometric View of the Prototype Swerve Drive Module
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Swerve Drive Module Side.png", width: 50%)
    ],
    caption: [ Side View of the Prototype Swerve Drive Module
    ]
  ) <odomDiagram>
  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Swerve Drive Module Front.png", width: 50%)
    ],
    caption: [ Front View of the Prototype Swerve Drive Module
    ]
  ) <odomDiagram>
  


  #components.admonition(type: "note")[
    It is unlikley any of these drives will be used as tank drives have proved superior for many games in a row. They simply serve as a way to practice building and design techniques and mechanisms before the next season. However, cataloging them is still important as the ideas learned from them could proove very important. 
  ]
]

#create-body-entry(
  title: "Mecanum Drive Testing",
  type: "test",
  date: datetime(year: 2024, month: 3, day: 19),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
  While Building the Mecanum Drive a large oversight was made. Vex wheels may be advertised in standard sizes like 4in but that is seldom the case. For the wheels various forum posts and the Perdu Vex Sig Robotics website placed both the older 4 in omni wheels and 4in mecanum wheels as having a 4.125in diameter. However once we built the drive we found the omni wheel to be slightly bigger. Going into inventor confirmed these as the Mecanum wheels measured .0625in smallers then the omni Wheels. 

  #figure(
    rect(fill: black.lighten(10%))[
      #image("img/Wheel Comparison.png", width: 80%)
    ],
    caption: [ Comparison of Mecanum Wheels and both the new (right) and old (left) omni wheel diameters
    ]
  ) 

  This means that for now until we can get the newer omni Wheels whish should be compatible with the mecanum wheels them alogn with the pto attached to them will be left out of the build. The older Wheels can not be used as they cause only one of the mecanum wheels to be in contact with the groudn which defeats the purpose of the drive. 

  Additionally weight plates needed to be screwed into the front to ensure the drive was balanced allowing it to properly strafe.

  Overall the Drive was a success after a few minor tweeks and will serve as a good test base until the season starts. 
]
#create-body-entry(
  title: "Rest of Pre-Season",
  type: "test",
  date: datetime(year: 2024, month: 3, day: 25),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[Since the most important job of ivnentorying was completed most of the team agreed to slow down until the next game was revealed to study for upcoming MCAP/AP/Final Exams and other School work. 

However, when we had the time to stop in at Robotics we worked to take apart the previous game's field as well as fix up the field border. This was done since the field border had been heavily weakened from many rams during our autonmous practices in the previous season. 
]
#create-body-entry(
  title: "Fund Raising",
  type: "test",
  date: datetime(year: 2024, month: 4, day: 12),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[During a group meeting today we disccused a variety of methods of fundraising. All ideas were taken and put on the right of the board (even jokes) and the possibly viable ideas were written on the right. A fund raiser would serve as a way to allow us access to the field earlier in the season so that we can get more practice. Durign the previous year the team worked off of a 3d printed tri-ball and a make-shift field made of old parts until around novemeber. To avoid this a fundraiser that gets atleast even around six hundred dollars would give us the field multiple months before the county may decide to buy it for us. 

Out of the many options we looked at we decided to try our hand at a simpel gofund me and send it to our families as it woudl be a very low amount of imput while having a psosbilility of a large output. We promised any doantors they would get a resin printed Eastern tech key-chain to encourage more doantions. All teammembers sent out the link to freinds and family to raise donations. 


  
]
#create-body-entry(
  title: "First Impressions of High Stakes",
  type: "test",
  date: datetime(year: 2024, month: 4, day: 27),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ After watching the conlcusion of worlds 3 of us Davis, Praful, and Andrews began to theorize ideas and startegies for the new game. This ideas were created before the release of the rule book and new ideas will be documented upon its release. 

Initially the similarity to the previous games of Round Up and Tipping point provide a wide variety of stratgies to draw from such as:
  - pneuamtically grabbing a mobile goal (MOGO)
  - Using an intake to place rings on a held MOGO

In addition some unique ideas were disscused such as
  - Using a D4Rb or similar lift to raise and lower the itnake to deposit at the variable elevations where the stakes reside
  - Having a pneumatic grip on the intake to grab the top bar and pull the robot off
  - Creating a descoring device to remove rigns from a goal
  - Having a atleast 4 ot possibly 6 motor drive to have enoguh power to hold the corners when needed

Multiple Ideas relatign to strategy were also discussed
  - Climbing is far more valuble compared to previous games due to reduced poitn values of the rings comapred to previous objects
  - Securing the corners is critical as they could flip a game in an instant
  - Havign a way to only put your rings or the enemies rigns onto a goal quickly could prove valueable
  - One could make a MOGO with only enemy rigns just for it to be put in the descore corner
  - The top ring seems pointless if it is only worth three points as going for it would require percision and a good amoutn of time that could be better used else where. 

To have some ideas for decoratign the robot and field were also discussed
  - One could draw the popular video game character kirby or a face in general on one of the rings
  - The top rings is the One ring to rule them all allowing for multiple lord of the rings refrences such as callign the robot the eye of sauron 

Overall we see this game as being far more complex then previous games requiring more advanced mechnisms and higher level of quality for a robot to be competetive. We shall begin protoyping some models in Inventor the following day and adjsut when the ruels are released. We are also intrested to see if there will be any big diffrences in skils comapred to the base game. 
 
]
#create-body-entry(
  title: "Inventor Prototypes-Pre Rulebook",
  type: "test",
  date: datetime(year: 2024, month: 4, day: 28),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
To start an intake with a lift were modeled along with a starting ideas for the drive. This was done so that we had a good starting palce to begin building when we met again later that week. In addition the drivetrain allows us to start making considerations for motor ditribution and the sizing of our manipulators

The intake is designed to use a chain belt with standoff screwed in that will hook onto the center of the rigns and pull them up as well as the lift to drop them off at vawrious heights of stakes


The drive train includes a variety of features some of which had been worked on during the preseason 
  - 6 motor drive with a pto to transfer two of the motors to a lift
  - 4 3.25 wheels omni wheels for tractions and maneuverability 
  - Vertical motor mount to save space
  - Hs axels used to secure the two halves of the drive
  - Pneumatic with lexan washers used to shift the gears in the pto
  - Odometry sensors to allow for an imrpoved and more accruate autonmous routine
Overall this is jsut a quick model put together and will be further explored as the season cointinues and we begin to construct the robot.
 
]
#create-body-entry(
  title: "Rules Reaction",
  type: "test",
  date: datetime(year: 2024, month: 4, day: 30),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
To the entire teams surprise the rulebook completely changes how the game is played compared to our inital thoughts from the video. Davis, Brandon, and Praful dicussed these on discord the night it was released. 

New rules
  - The vertical expansion limit makes the previous lfit models too tall, but not out of the picture as elevatign thei tnake could still help with climbing and depoisting rings
  - It is require to go rung by rung to climb greatly icnreasing the challenge in doing so, but the point values still make it worthwhile
  - The expansion limits do make the high stake worth far less as to score it would require climing to the top rung and then havign a mechnism to score it for only 3 more points. 
Skills
  - The rules reagarding the diffrent rings makes it valuable for the robot to be able to sort out colors in it's intake to ensure no rings are waisted
  - The corners are still valuable for the 5 points per MOGO, but not as crucial for the game. 
  - Descore mechanisms could help remove the pre-scored blue rings for more points

Final thoughts for the first Robot
- 6 motor drive
- intake on a lift
- pneuamtic clamp to grab MOGOs
- Clamp on intkae/lift to grab the first rung
- Passive clamps to hold onto the climbing rungs so that the lift can raise and grab the next rung
- Descore mech to help in skills and matches




]
#create-body-entry(
  title: "Initial Goals and Plan",
  type: "test",
  date: datetime(year: 2024, month: 5, day: 1),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[ 
 
]
#create-body-entry(
  title: "Fund Raising Results",
  type: "test",
  date: datetime(year: 2024, month: 5, day: 1),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  The fundraiser is still ongoing, however 765 dollars was raised which is able to cover the field costs as well as shipping as tax whcih allowed us to puchase the field today. This should allow us to get started far sooner then in previous years and allow for the testing of more protypes before the first comeptions. 
 
]
#create-body-entry(
  title: "First Intake Builds",
  type: "test",
  date: datetime(year: 2024, month: 5, day: 2),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
We started by building the basic Intake modeled in Inventor and worked to create various imrpvoements as we went based on the problems we ran into. (It is to be noted these tested were with a 3d printed ring so the weight problems incurred may not be accurate)

Intial tests using a standoff intake similar to those in Tipping point saw the chain flex and drop the rigns as they were too heavy. To adjust for this flexwheels were tried and foudn to work very well. However, as we incraesed the inclien of the intake the flexwheels became worse at picking the rings from the ground, but not carrying them up ocne the intake secrued them. To alieviate this standoffs were added in the center of the inital stage of the intake. This helepd, but it jammed occasioanlly which was fixed by makign the first stage of the intake flaoting. This means it can rotate to allow the disk to enter more smoothly. After multiple changes to the gripping devices a final design was settled on. (Picture of diffrent intake rollers/chains with decribition and charts of each ones ability to intake )
]
#glossary.add-term("Omni Wheel")[A shortened form of omni-directional wheel which is a wheel with rollers allowing it to be pushed side to side]
#glossary.add-term("PTO")[Power take off device which takes the rotation of a motor and transfers it from one mechanism to another. Thye are often pneumatically powered, but can work with motors.]
#glossary.add-term("Odometry")[An algorithim which determines the robots position based on the movement of 3 sensor wheels.]

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]

#create-appendix-entry(title: "Credits")[
   - Purdue Sigbots
   - Stanford_O from the vex forums
]
