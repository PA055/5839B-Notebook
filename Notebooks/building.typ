#import "/lib.typ": *
#import themes.radial: radial-theme, components, colors
#import colors: *

#show: notebook.with(theme: radial-theme, team-name: "5839B", season: "Water Game", year: "2024-2025")


#create-frontmatter-entry(
  title: "Table of Contents",
  type: "decide",
  date: datetime(year: 2024, month: 1, day: 9),
)[
  #components.toc()
]

#create-body-entry(
  title: "First Steps",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 9),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  = Post Season Build Analysis 

  For the building of our previous robot even though it unfortunately did not make worlds there were a lot of aspects executed properly and poorly to be identified. This is important as it allows the team to know what works and to keep doing as well as what to change in order to improve for the next season 

  Successes:
  The intake, which was the most recently designed aspect of the previous robot worked perfectly as it was able to hold onto a triball easily and drive with it as well as insert it into the goal when needed. Flex wheels proved to be invaluable here as not only were they less of a hassle than rubber bands they also proved to be more reliable and provided great traction for grasping the game objects. The use of the various building techniques such as boxing screws with spacers for added strength and using shoulders screws to ensure the design lined up properly helped with this greatly. These techniques were also used across the robot and allowed for greatly increased strength especially after repeated matches. 
  
  Another major success of the previous design was the flywheel. It made great use of the weight plates as well as a ratchet to help reduce motor strain. For any future games that need a flywheel this design could be copied easily along with the ratchet for any mechanisms that require it. 

  Failures:

  The Drivetrain was one of the biggest failures of the previous design and is the area for the largest improvements to be made. It experienced heavy reliable issues due to a variety of factors. It also experienced a constant slight drift as well as random incidents of extreme drift that were fixed by taking out and putting back random screws until it worked. Finally, the driver was very prone to overheating, which limited testing time as we had to wait for the motors to cool down. There are a variety of causes for this that can be learned from the improved future designs. Firstly, in an attempt to save space lexin with holes drilled into as a form of bearing were used instead of the traditional bearing flats or ball bearings. This not only attempted to save space as the plastic was 1/16in compared to the bearing flat at 1/4in but was used to create a boat shape to cross the middle bar of over under. This led to not only increased friction as the holes were not perfectly aligned as with the standard bearings, but also, they wore down over time and were not easy to replace. They also began to warp out in some places hitting against the gears and causing friction. The inconsistency within these plastic bearings likely led to uneven amounts of friction on either side of the drive. This would cause the drift as well as heightened overheating of the vex motors. To avoid this Lexan should only be used as a bearing sparingly as well as not in a mechanism that sees a lot of wear and tear such as the drive. Additionally high strength axels could be used over low strength ones to increase the drive train's resilience. However, this may not always be possible as some of the wheels the team owns only accept low strength axels. Finally, more thought could be put into making the drive easily repairable to fix any issues that could cause drift or overheating in future designs. 

  The robot's weight balancing was very poor and led to it lurching at the start and end of fast motion. This led to less control of the robot being possible as these movements were unpredictable. The design focused a lot of weight towards the front with the lift arm, wings, battery, and pneumatic tanks, whilst the rear had the intake and the brain making it mostly empty space. To improve on this, we could focus more of the heavy components such as the pneumatic tanks and batteries towards the bottom middle to weigh the robot down and keep its center of gravity in the middle. Additionally, as I saw another team do at states flywheel weight plates could be screwed onto the lighter half of a robot to weigh it down and move the center of gravity. The center of gravity through a variety of means should be kept low and in the middle of any future designs.

  The previous odometry sensor moduel designs also proved to be unrealible. The aluminum plates used for the sides were foudn to warp out after repeated use. Additionally the older design was bukly and had little room to move. This is very important for the autonmous as it's alogrithms rely on percise readings from these wheels. If they are not able to spin proplery or be in costant contact with the ground they make the autonmous unreliable. To fix this the design could use c channels which bends less as well as work to make it the modules more compact in order for them to fit with more room to move. 

  Though not directly related to the build it was found by the Cole the driver that it was not possible to keep the robot in motion with the joysticks whilst pressing the arrow or letter buttons on the controller. To alleviate this, we plan to 3d print attachments that press the controllers button using fingers other than the thumbs so that motion can be maintained while performing key actions

  = What to do now?

  -With the biggest problem being the drive a variety of drives should be modeled and tested in order to have a better idea of what works for the next season

  -Work to create new odometry module desings that are stronger and more compact

  -Take inventory of the parts available to our team so that when designing we know what parts we can use and how many of them are available 

  -Put together an order list of parts that the team wants to asses the needed funds

  -See what funding is available to the team and what amount should be allocated to new parts 

  -Look into making a functional PTO (power take off) as they can allow for more powerful drives while still having all the desired mechanisms to manipulate game objects

  -Look for or model our own paddels for the controller that suite the needs of our driver


]
#create-body-entry(
  title: "Drive Train Types",
  type: "brainstorm",
  date: datetime(year: 2024, month: 3, day: 9),
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
) -> Tank Drives
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
) -> X/H Drives
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
) -> Mecanum Drives




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
) -> Swerve Drives

]
#create-body-entry(
  title: "3d design software",
  type: "decide",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  Before any models for possible drive trains or new odometry sensors can be made a decision on what software to use is necessary. In the previous season we adpoted Autodesk inventor. There were a variety of reasons for this the primary one being familiarity. At Eastern Technical Highschool their is an Engineerign Magnet program which teaches Autodesk inventor. This not only means over half the team who is in this program know the software, but also there is 3 teachers who can assist us with any issues. Also with Inventor being used by the school the county provides a VDI or Virtual Desktop Interface where you can log in remotley to a desktop with Inventor. This allows the team who does not all have access to a high qaulity laptop to access the model on the shcool issued chromebooks. Due to these reasons we find it impractical to switch design softwares. Not only would we have to remake some of our premade assemblies such as for flex wheels, but we woudl have to spend time learnign new software which outweighs any of the other softwares advantages. 
]
#create-body-entry(
  title: "Taking Inventory",
  type: "managment",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  Before any designing can take place it is key to know the constraints one is placed under. For vex a key way of doing this other then reading the rules is too see what parts are available to your team. You may have the best idea for a design but without hte parts to build that idea is jsut waisted time.In order to see what parts we had an excel spread sheet was created with all Vex Parts that were in our Inventor parts library as well as newer ones found the Vex website. Additionally Tools and other accesories from the Robosource website were included that we deemed may prove useful.

  The Spreadsheet will take a while to fill out, but for now parts with known quanitities such as zero have been filled out. Those were marked with yellow to indicate more were needed. These were then taken to a second spreadsheet. This lays out all the parts and tools we want, their price, quanity, link to purchase, and priority. The priority is key as it allows us to make decisions on what to get within our budget. 


#components.admonition(type: "note")[
    Currently the budget is at zero as dues are yet to be collected and no fund raisers have been planned. It also improt to consider that a small percentage of the school's 15,000 dollar engineerign budget is randomly allocated to us so we will have that to work with. 
  ]
]
#create-body-entry(
  title: "TInvenory Results",
  type: "Managment",
  date: datetime(year: 2024, month: 3, day: 10),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)[
  After a week of work we were able to complete all rows of the spread sheet and figure out what parts the team was in need of. A variety of methods were used to measure the various parts. Large parts like Wheels and Motors were counted but other parts required a different aporach. String wires, and tubing were measured in feet, and metal strcuture by its weight. For parts like screws and nuts a single unit was weighed as well as the container and the total amount we had. The weight of the container was then subtracted from the total and then divided by the unit to find the total quanity. 
  
  #components.admonition(type: "note")[
    We found our time managment to be extremely poor during this endevor which greatly increased its length. To adress this we may work to change how the team meets to allow for not only more time, but better uses of that time. 

]

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

-4 Mecanum wheels geared to 300 RPM with a 72:48 ratio driven by an 11w motor with the 600rpm cartrige. 

-24in HS axels with holes drilled in them as the main frame to ensure it was stronger then our previous drive trains.

-Center Omni Wheel for additional power

-PTO to allow for the cneter omni wheel to power other system while not in use

-Battery and Air Tanks kept low to ensure a proper center of gravity

-New Odometry Sensor fitted in the rear


Before we could enter school to test this I created a Model for a Swerve Drive module:

-Keeps design compact with motors below the frame

-72 tooth gear is screwed to the frame so they spin together

-Circular insert within the gear to allow the drive shaft to turn

-Chain runs to connect the Drive Shaft to the 11w motor

-5.5w motor used to turn module 


#components.admonition(type: "note")[
    It is unlikley any of these drives will be used as tank drives have proved superior for many games in a row. They simply serve as a way to practice building and design techniques and mechanisms before the next season. However, cataloging them is still important as the ideas learned from them could proove very important. 
  ]





]


