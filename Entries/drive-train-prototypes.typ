#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry(
  title: "Drive Train Prototypes",
  type: "build",
  date: datetime(year: 2024, month: 3, day: 17),
  author: "Davis Bodami",
  witness: "Praful Adiga"
)
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
